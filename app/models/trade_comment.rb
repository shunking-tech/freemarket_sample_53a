class TradeComment < ApplicationRecord
  belongs_to :user
  belongs_to :trade
end
