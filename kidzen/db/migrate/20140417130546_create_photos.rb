class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
        t.references :post, index: true
      	t.string :description
      	t.string :image
      	t.string :remote_image_url
      	t.timestamps
    end
  end
end
