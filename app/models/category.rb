class Category < ApplicationRecord
  has_many :items
  has_ancestry

  def belongs_items(limit = nil)
    if has_children?
      indirects.present? ?
        Item.category_items(indirects.ids).recently.limit(limit).includes(:item_images) :
        Item.category_items(children.ids).recently.limit(limit).includes(:item_images)
    else
      Item.category_items(id).recently.includes(:item_images)
    end
  end
end
