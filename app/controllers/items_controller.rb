class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def mypage_item_show
    @item = Item.find(params[:id])
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to controller: 'users', action: 'show', id: current_user.id
  end
end
