class CreateItemLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_likes do |t|

      t.timestamps
    end
  end
end
