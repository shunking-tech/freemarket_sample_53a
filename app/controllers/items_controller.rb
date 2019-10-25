class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :mypage_item_show, :edit, :update, :destroy]

  def index
  end

  def show
    # 一旦、保留
    # @item_comment = ItemComment.new
    # @item_comments = @item.item_comments
  end

  def new
    @item = Item.new    # 消す
    @item.item_images.build    # 消す
  end

  # 消す
  def create
    item = Item.new(item_params)   # 消す
    item.size_id = 1   # 消す
    item.save   # 消す
  end

  def mypage_item_show
  end

  def edit
    @item.item_images.build
    @parents = Category.all.order("id ASC").limit(13)
    gon.item_images = @item.item_images       # 保存されている画像の配列変数をjavascriptで使えるようにする
  end

  def update
    delete_image_ids = delete_image_id_params[:delete_image_id]
    if delete_image_ids && delete_image_ids.length == @item.item_images.length
      @error = "画像がありません"
      render :edit
    elsif @item.update(item_params)

      if delete_image_ids
        delete_image_ids.each do |id|
          ItemImage.find(id).destroy
        end
      end

      redirect_to action: 'mypage_item_show'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to controller: 'users', action: 'show', id: current_user.id
  end

  private
  def set_item
    # @item = Item.find(params[:id]).decorate　よくわからないため、一旦decorateを削除
    @item = Item.find(params[:id])
  end

  # 商品出品とコンフリクトするかも
  def item_params
    params.require(:item).permit( :name,
                                  :price,
                                  :description,
                                  :condition,
                                  :task,
                                  :payer_delivery_expense,
                                  :shipping_method,
                                  :delivery_days,
                                  :category_id, :size_id,
                                  :prefecture_id,
                                  item_images_attributes:[:id, :image, :item_id]
                                ).merge(user_id: current_user.id)
  end

  def delete_image_id_params
    params.permit(delete_image_id:[])
  end
end
