class ItemImage < ApplicationRecord
  belongs_to :item, optional: true
  mount_uploader :image, ImageUploader
  
  # mount_uploadersに変更すると複数投稿
  # view画面に multiple: trueを追加で設定可能
  # 一旦一枚の画像のみで設定
  validates :item_id ,presence: true
end
