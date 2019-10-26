class DeliverAddress < ApplicationRecord
  belongs_to :user

  validates_with DeliverAddressValidator
end
