class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :mypage_item_show, :destroy]

  def index
  end

  def show
    # 一旦、保留
    # @item_comment = ItemComment.new
    # @item_comments = @item.item_comments
  end

  def new
  end

  def mypage_item_show
  end

  def destroy
    @item.destroy
    redirect_to controller: 'users', action: 'show', id: current_user.id
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
