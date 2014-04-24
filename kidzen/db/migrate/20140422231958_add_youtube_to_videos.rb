class AddYoutubeToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :youtube, :string
  end
end
