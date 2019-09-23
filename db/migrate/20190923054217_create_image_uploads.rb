class CreateImageUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :image_uploads do |t|
      t.string :image
      t.timestamps
    end
  end
end
