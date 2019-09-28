class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(params[:id])
    @item_comment = ItemComment.new
    @item_comments = @item.item_comments
  end

  def new
  end

end
