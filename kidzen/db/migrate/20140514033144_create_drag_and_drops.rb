class CreateDragAndDrops < ActiveRecord::Migration
  def change
    create_table :drag_and_drops do |t|
    	t.string :name
    	t.string :image
    end
  end
end
