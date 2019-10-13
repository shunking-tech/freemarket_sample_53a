class ItemsController < ApplicationController
  # before_action :logged_in_user, only: [:index, :edit, :update]
  def index
    @items = Item.all.order("id desc").limit(10)
    @categories = Category.all
  end

  def show
    @item = Item.new 
  end

  def search
    @items = []
  end

  def new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.permit(:name, :price, :description, :condition, :task, :payer_delivery_expensemage, :delivery_days, :prefecture, :user_id, :category, :size)
  end
end