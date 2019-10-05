class ItemLikesController < ApplicationController
  before_action :move_to_login, :set_item

  def create
    like = current_user.item_likes.new(item_id: @item.id)
    respond_to do |format|
      if like.save
        format.html { redirect_to items_path(@item) }
        format.js
      else
        format.html { redirect_to items_path(@item) }
        format.js
      end
    end
  end

  def destroy
    like = ItemLike.find_by(item_id: @item.id, user_id: current_user)
    respond_to do |format|
      like.destroy
      format.js
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_login
    redirect_to login_url unless user_signed_in?
  end
end
