class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    if @category.has_children?
      @categories = @category.children
      @items = @category.indirects.present? ? 
                Item.category_items(@category.indirects.ids).recently.page(params[:page]).per(PAGENATE) :
                Item.category_items(@categories.ids).recently.page(params[:page]).per(PAGENATE)
    else
      @categories = @category.siblings
      @items = Item.category_items(@category.id).recently.page(params[:page]).per(PAGENATE)
    end
    # binding.pry
  end

  private

  PAGENATE = 20

end
