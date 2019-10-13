class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  # belongs_to :size,optional: true
  # belongs_to :prefecture
  has_many :item_images
  # has_many :item_likes
  # has_many :liked_users,through: :item_likes, source: :user
  # has_one :teade

end
