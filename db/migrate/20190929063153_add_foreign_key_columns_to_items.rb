class AddForeignKeyColumnsToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :category, foreign_key: true, null: false
    add_reference :items, :size, foreign_key: true, null: false
  end
end
