class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.integer :condition, null: false, default: 0
      t.integer :task, null: false, default: 0
      t.integer :payer_delivery_expense, null: false, default: 0
      t.integer :shipping_method, null: false, default: 0
      t.integer :delivery_days, null: false, default: 0
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
