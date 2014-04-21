class Photos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :description
      t.string :image
      t.string :remote_image_url
      t.timestamps
    end
  end
end
