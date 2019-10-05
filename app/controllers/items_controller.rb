class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(params[:id]).decorate
    # 一旦、保留
    # @item_comment = ItemComment.new
    # @item_comments = @item.item_comments
  end

  def new
  end

end
