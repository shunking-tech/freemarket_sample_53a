class Users::CreditCardsController < ApplicationController
  require "payjp"

  before_action :set_credit_card, only: [:show, :new, :destroy]
  before_action :set_PAYJP_PRIVATE_KEY, only: [:show, :create, :destroy]

  def show
    if @credit_card.present?
      customer = Payjp::Customer.retrieve(@credit_card.customer_id)
      @default_card_information = customer.cards.retrieve(@credit_card.card_id)
      set_card_limit
      set_brand_icon
    end
  end

  def new
    redirect_to action: "show" if @credit_card.present?
  end

  def create
    # payjpの顧客データを作成
    if params['payjp_token'].present?
      customer = Payjp::Customer.create(
        card: params['payjp_token'],
        metadata: {user_id: current_user.id}
      )
      # credit_cardsテーブルにレコードを保存
      @credit_card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @credit_card.save
        redirect_to action: "show"
      else
        redirect_to action: "create"
      end
    else
      redirect_to action: "new"
    end
  end

  def destroy
    if @credit_card.present?
      customer = Payjp::Customer.retrieve(@credit_card.customer_id)
      customer.delete
      @credit_card.delete
    end
    redirect_to action: "show"
  end

  private
  # payjp秘密鍵を取得
  def set_PAYJP_PRIVATE_KEY
    Payjp.api_key = Rails.application.credentials.payjp[:private_key]
  end

  # クレジットカード情報を取得
  def set_credit_card
    @credit_card = CreditCard.where(user_id: current_user.id).first
  end

  # 使用期限を取得
  def set_card_limit
    exp_month = @default_card_information.exp_month.to_s
    exp_year = @default_card_information.exp_year.to_s.slice(2,3)
    @card_limit = exp_month + " / " + exp_year
  end

  # カードブランドのアイコンを取得
  def set_brand_icon
    @card_brand = @default_card_information.brand
      case @card_brand
        when "Visa"
          @brand_icon = "/visa.svg"
        when "JCB"
          @brand_icon = "/jcb.svg"
        when "MasterCard"
          @brand_icon = "/master-card.svg"
        when "American Express"
          @brand_icon = "/american_express.svg"
        when "Diners Club"
          @brand_icon = "/dinersclub.svg"
        when "Discover"
          @brand_icon = "/discover.svg"
      end
  end

end