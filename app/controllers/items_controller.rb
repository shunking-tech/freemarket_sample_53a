class ItemsController < ApplicationController
  before_action :set_item, only: [:mypage_item_show, :destroy]

  def index
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
