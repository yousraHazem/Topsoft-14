class CreateProfileMusics < ActiveRecord::Migration
  def change
    create_table :profile_musics do |t|
      t.integer :user_id
      t.string :mp3_url
      t.string :youtube_url

      t.timestamps
    end
  end
end
