class CreateUserReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reviews do |t|
      t.integer     :score,   null:false
      t.string      :comment, null: false
      t.references  :user,    null: false, foreign_key: true
      t.references  :trade,   null: false, foreign_key: true

      t.timestamps
    end
  end
end
