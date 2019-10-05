class CreateItemLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_likes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false
      t.timestamps
    end
  end
end
