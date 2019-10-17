class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  include Scopes

  enum condition: [:unused, :almost_new, :non_dirty, :little_dirty, :dirty, :bad]
  enum task: [:exhibiting, :waiting_shipping, :rating_seller, :rating_buyer, :complete, :stopping]
  enum payer_delivery_expense: [:seller_burden, :buyer_burden]
  enum shipping_method: [:undecided, :easy_mercari_post, :yu_mail, :letter_pack, :regular_mail, :yamato, :yu_pack, :click_post, :yu_packet]
  enum delivery_days: [:within1_2days, :within2_3days, :within4_7days]

  belongs_to :user
  has_many :item_comments
  has_many :item_images, dependent: :destroy
  has_many :item_likes
  has_many :liked_users, through: :items_likes, source: :user
  belongs_to_active_hash :prefecture
  belongs_to :category
  belongs_to :size
  has_one :trade

  scope :category_items, -> (category_id) { where('category_id = ?', category_id) }

  # MEMO: scopeがnilを返す場合は検索対象のモデルのallが適用されるためクラスメソッドで記述
  def self.prev_item(item)
    recently.where('created_at <= ? and id < ?', item.created_at, item.id).first
  end

  # MEMO: scopeがnilを返す場合は検索対象のモデルのallが適用されるためクラスメソッドで記述
  def self.next_item(item)
    recently.where('created_at >= ? and id > ?', item.created_at, item.id).last
  end

  def after_first_categories
    category.path.slice(1..-1)
  end

  def delimited_price
    price.to_s(:delimited)
  end

  def user_other_items
    user.items.recently.where.not(id: self.id)
  end

  def category_other_items
    category.items.recently.where.not(id: self.id)
  end

  def liked_by?(user)
    item_likes.where(user_id: user).present?
  end

  def seller?(target_user)
    unless target_user.nil?
      user.id == target_user.id
    else
      false
    end
  end
end
