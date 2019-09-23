class ImageUploadsController < ApplicationController
  def index
    @image_uploads = ImageUpload.all
  end
  
  def create
    ImageUpload.create(image_upload_params)
    redirect_to image_uploads_path
  end

  private
  def image_upload_params
    params.require(:image_upload).permit(:image)
  end
end
