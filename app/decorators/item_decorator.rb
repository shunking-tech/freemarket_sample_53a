class ItemDecorator < Draper::Decorator
  delegate_all

  def player_expense_detail
    if payer_delivery_expense_i18n == Item.payer_delivery_expenses_i18n[:seller_burden]
      "#{payer_delivery_expense_i18n}(出品者負担)"
    elsif payer_delivery_expense_i18n == Item.payer_delivery_expenses_i18n[:buyer_burden]
      "#{payer_delivery_expense_i18n}(購入者負担)"
    else
      "不明"
    end
  end

end
