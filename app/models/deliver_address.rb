class DeliverAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :prefecture

  validates_with DeliverAddressValidator
end
