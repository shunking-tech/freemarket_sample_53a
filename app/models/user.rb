class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :sns_credentials, dependent: :destroy

  validates_with UserValidator
  has_many :items
  has_many :item_likes
  has_many :liked_items, through: :item_likes, source: :item
  has_many :item_comments

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
end
