class AddPhotoTypeToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :photo_type, :string
  end
end
