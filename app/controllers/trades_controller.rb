class TradesController < Users::CreditCardsController
  before_action :set_credit_card, :set_PAYJP_PRIVATE_KEY, :set_item

  def new
    redirect_to root_path if @item.user_id == current_user.id
    if @credit_card.present?
      customer = Payjp::Customer.retrieve(@credit_card.customer_id)
      @default_card_information = customer.cards.retrieve(@credit_card.card_id)
      set_card_limit
      set_brand_icon
    end
    @trade = Trade.new
  end

  def create
    @trade = Trade.create(trade_params)
    # payjpに支払い情報を作成
    Payjp::Charge.create(
      amount: @item.price,
      customer: @credit_card.customer_id,
      currency: 'jpy',
      metadata: {trade_id: @trade.id},
    )
    redirect_to root_path
  end

  private
  def set_item
    @item = Item.find(params[:item_id]).decorate
  end

  def trade_params
    params.require(:trade).permit(:seller_id, :buyer_id, :item_id, :status)
  end
end