class ChangeDataBirthDateSecond < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :birth_date, :string
  end
end
