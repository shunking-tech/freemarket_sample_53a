class Trade < ApplicationRecord
  include Commentable
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  belongs_to :item

  validates :status, presence: true
  validate :custom_trade_validate

  def custom_trade_validate
    if seller_id === buyer_id
      errors.add(:seller_id, "が同一人物です")
      errors.add(:buyer_id, "が同一人物です")
    end
  end
end
