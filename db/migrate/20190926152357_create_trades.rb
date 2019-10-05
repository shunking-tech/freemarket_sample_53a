class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.references :buyer,  null: false, foreign_key: { to_table: :users }
      t.references :item,   null: false, foreign_key: true
      t.integer    :status, null: false

      t.timestamps
    end
  end
end
