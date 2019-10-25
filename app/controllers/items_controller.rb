class ItemsController < ApplicationController
  before_action :set_item, only: [:mypage_item_show, :edit, :update, :destroy]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
    @item.item_images.build
  end

  def create
    @item = Item.new(item_params)
    @item.size_id = 2 #デフォルトで入れておきます
      if params[:item][:item_images_attributes] && @item.save
        redirect_to root_path notice: "出品されました"
      else
        render :new
        flash.now[:alert] = "未入力項目があります"
      end
  end

  def mypage_item_show
  end

  def edit
    @item.item_images.build
    @parents = Category.all.order("id ASC").limit(13)
    gon.item_images = @item.item_images       # 保存されている画像の配列変数をjavascriptで使えるようにする
  end

  def update
    @item.update(item_params)
    delete_image_ids = delete_image_id_params[:delete_image_id]

    if delete_image_ids
      delete_image_ids.each do |id|
        ItemImage.find(id).destroy
      end
    end

    redirect_to action: 'mypage_item_show'
  end

  def destroy
    @item.destroy
    redirect_to controller: 'users', action: 'show', id: current_user.id
  end

  def search
    if params(@item)
      @c_item = Item.find(params[:id]).children
    else
      @t_item = Item.find(params[:item_id]).children
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, 
                                  :price,
                                  :description,
                                  :condition,
                                  :task,
                                  :payer_delivery_expense,
                                  :delivery_days,
                                  :shipping_method,
                                  :category_id,
                                  :size_id,
                                  :prefecture_id,
                                  item_images_attributes:[:id, :image, :item_id]
  ).merge(user_id: current_user.id)
  end

  def delete_image_id_params
    params.permit(delete_image_id:[])
  end

end
