class CreateItemComments < ActiveRecord::Migration[5.2]
  def change
    create_table :item_comments do |t|
      t.string      :content, null: false
      t.references  :user,    null: false, foreign_key: true
      t.references  :item,    null: false, foreign_key: true



      t.timestamps
    end
  end
end
