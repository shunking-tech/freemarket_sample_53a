class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  enum condition: [:unused, :almost_new, :non_dirty, :little_dirty, :dirty, :bad]
  enum task: [:exhibiting, :waiting_shipping, :rating_seller, :rating_buyer, :complete, :stopping]
  enum payer_delivery_expense: [:undecided, :yamato, :yu_pack, :yu_mail]
  enum delivery_days: [:within1_2days, :within2_3days, :within4_7days]

  belongs_to :user
  has_many :item_comments
  has_many :item_images, dependent: :destroy
  has_many :item_likes
  has_many :liked_users, through: :items_likes, source: :user
  belongs_to_active_hash :prefecture
  belongs_to :category
  belongs_to :size
end
