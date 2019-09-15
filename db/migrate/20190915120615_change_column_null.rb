class ChangeColumnNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :prefecture, true
    change_column_null :users, :city, true
    change_column_null :users, :house_address, true
    change_column_null :users, :zipcode, true
  end
end
