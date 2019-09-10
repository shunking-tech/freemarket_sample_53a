class AddNullFalseToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :nickname, false
    change_column_null :users, :first_name, false
    change_column_null :users, :first_name_kana, false
    change_column_null :users, :last_name, false
    change_column_null :users, :last_name_kana, false
    change_column_null :users, :birth_date, false
    change_column_null :users, :zipcode, false
    change_column_null :users, :prefecture, false
    change_column_null :users, :city, false
    change_column_null :users, :house_address, false
  end
end
