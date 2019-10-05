class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name,                   null: false
      t.integer     :price,                  null: false
      t.text        :description,            null: false
      t.integer     :condition,              null: false
      t.integer     :task,                   null: false
      t.integer     :payer_delivery_expense, null: false
      t.integer     :delivery_days,          null: false
      t.string      :prefecture,             null: false
      t.bigint      :user_id,                null: false, foreign_key: true
      t.bigint      :category_id,               null: false
      t.bigint      :size,                   null: false      
    
      t.timestamps

      t.references :user,           foreign_key: true
      t.references :category,       foreign_key: true
    end

    # add_index       :name,  unique: true
  end
end
