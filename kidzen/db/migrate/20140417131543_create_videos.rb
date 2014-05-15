class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :description
      t.string :category
      t.string :file
      t.string :real_file
      t.string :youtube
      t.string :screenshot
      t.timestamps
    end
  end
end
