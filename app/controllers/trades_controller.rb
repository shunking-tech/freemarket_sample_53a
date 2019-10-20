class TradesController < Users::CreditCardsController
  before_action :set_credit_card, :set_PAYJP_PRIVATE_KEY, :set_item
  before_action :check_trades_validation

  def new
    if @credit_card.present?
      customer = Payjp::Customer.retrieve(@credit_card.customer_id)
      @default_card_information = customer.cards.retrieve(@credit_card.card_id)
      set_card_limit
      set_brand_icon
    end
    @trade = Trade.new
  end

  def create
    if @trade.save
      # payjpに支払い情報を作成
      Payjp::Charge.create(
        amount: @item.price,
        customer: @credit_card.customer_id,
        currency: 'jpy',
        metadata: {trade_id: @trade.id},
      )
      # 商品の状態を"waiting_shipping"に更新
      @item.update_attributes(task: 1)
      return redirect_to user_path(current_user.id)
    else
      redirect_to root_path
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id]).decorate
  end

  def trade_params
    params.require(:trade).permit(:seller_id, :buyer_id, :item_id, :status)
  end

  def check_trades_validation
    # 商品が出品中ではない、または出品者と購入者が同じ場合は商品詳細画面にredirect
    if @item.user_id == current_user.id || ["waiting_shipping", "rating_seller", "rating_buyer", "complete", "stopping"].include?(@item.task) && @item.task != "exhibiting"
      redirect_to item_path(@item.id)
    end
  end
end