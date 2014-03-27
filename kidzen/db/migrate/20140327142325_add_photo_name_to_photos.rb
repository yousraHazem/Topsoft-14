class AddPhotoNameToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :photo_name, :string
  end
end
