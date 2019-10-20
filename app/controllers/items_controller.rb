class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :mypage_item_show, :destroy]

  def index
    # 一旦、保留
    # root_categories = Category.where(ancestry: nil)
    # @categories = []
    # root_categories.each do |category|
    #   @categories.push({category: category, count: category.belongs_items.count})
    # end
    # @categories = @categories.sort_by {|a| -a[:count]}.map { |obj| obj[:category] }.take(4)

    @categories = Category.roots.limit(4)
  end

  def search
    @items = []
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
    @item = Item.includes(:item_images).find(params[:id]).decorate
  end
end
