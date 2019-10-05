class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(params[:id]).decorate
    @item_comment = ItemComment.new
    # 一旦、保留
    # @item_comments = @item.item_comments
  end

  def new
  end

end
