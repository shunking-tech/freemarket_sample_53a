class Users::ListingsController < ApplicationController
  def listing
    @items = current_user.items.includes(:item_images).where(task: :exhibiting)
  end

  def in_progress
    @items = current_user.items.includes(:item_images).where(task: [:waiting_shipping, :rating_seller, :rating_buyer])
    render :listing
  end

  def completed
    @items = current_user.items.includes(:item_images).where(task: :complete)
    render :listing
  end
end
