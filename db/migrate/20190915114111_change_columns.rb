class ChangeColumns < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :prefecture,:string, true
    change_column_null :users, :city,:string, true
    change_column_null :users, :house_address,:string, true
    change_column_null :users, :zipcode,:string, true
  end
end
