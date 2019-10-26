class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :sns_credentials, dependent: :destroy
  has_many :items
  has_many :item_likes
  has_many :liked_items, through: :item_likes, source: :item
  has_many :item_comments
  has_many :user_reviews
  has_one :credit_card
  has_one :deliver_address

  validates_with UserValidator

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first

    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
      unless user.present?
        user = User.new(nickname: auth.info.name, email: auth.info.email)
      end
      sns = snscredential
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        sns = SnsCredential.new(uid: uid, provider: provider, user_id: user.id)
      else
        user = User.new(nickname: auth.info.name, email: auth.info.email)
        sns = SnsCredential.new(uid: uid, provider: provider)
      end
    end
    return { user: user , sns: sns }
  end

  def good_count
    user_reviews.good_score.count
  end

  def normal_count
    user_reviews.normal_score.count
  end

  def bad_count
    user_reviews.bad_score.count
  end

  def full_name
    "#{last_name}#{first_name}"
  end
end
