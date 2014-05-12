class CreatePuzzles < ActiveRecord::Migration
  def change
    create_table :puzzles do |t|
      t.string :description
      t.string :image
      t.string :remote_image_url
      t.timestamps
    end
  end
end
