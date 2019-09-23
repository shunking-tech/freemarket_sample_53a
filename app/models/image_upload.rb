class ImageUpload < ApplicationRecord
  mount_uploader :image, ImagesUploader
end
