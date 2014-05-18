class CreateSong < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :file
      t.string :real_file
      t.timestamps
    end
  end
end
