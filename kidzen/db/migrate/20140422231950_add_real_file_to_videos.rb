class AddRealFileToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :real_file, :string
  end
end
