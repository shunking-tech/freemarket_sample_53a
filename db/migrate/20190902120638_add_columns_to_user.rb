class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :avatar, :string
    add_column :users, :description, :text
    add_column :users, :first_name, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :last_name, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :birth_date, :string
    add_column :users, :phone_number, :string
    add_column :users, :prefecture, :string
    add_column :users, :city, :string
    add_column :users, :house_address, :string
    add_column :users, :building_name, :string
    add_column :users, :zipcode, :string
  end
end
