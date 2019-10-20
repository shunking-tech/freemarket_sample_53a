class Trade < ApplicationRecord
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  belongs_to :item

  validates :seller_id, :buyer_id, :item_id, :status, presence: true
  validate :custom_trade_validate

  def custom_trade_validate
    if seller_id === buyer_id
      errors.add(:seller_id, "購入者が同一人物です")
      errors.add(:buyer_id, "出品者が同一人物です")
    end
  end
end
