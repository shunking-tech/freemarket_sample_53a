class ItemsController < ApplicationController
  before_action :set_item, only: [:mypage_item_show, :destroy]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
    @item.item_images.build
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to new_item_path
    else
      render :new
    end
  end

  def mypage_item_show
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to controller: 'users', action: 'show', id: current_user.id , notice: "商品を削除しました"
    end
  end

  def edit
    @item.item_images.each do |img|
      @image = img.image
    end
  end

  def update
    if @item.user_id == current_user.id
      @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
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

end
