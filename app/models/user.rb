class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_with UserValidator
  has_many :items
  has_many :item_likes
  has_many :liked_items, through: :item_likes, source: :item
  has_many :item_comments
end
