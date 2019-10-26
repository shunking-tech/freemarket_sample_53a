class CreateDeliverAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :deliver_addresses do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.string :zipcode, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :house_address, null: false
      t.string :building_name
      t.string :phone_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
