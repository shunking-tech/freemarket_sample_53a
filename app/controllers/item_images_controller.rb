class ItemImagesController < ApplicationController
  
  def new
    @item_image = Item_image.new
  end
end
