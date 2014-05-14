class CreateDragAndDropScores < ActiveRecord::Migration
  def change
    create_table :drag_and_drop_scores do |t|
    	t.integer :score
    	t.integer :drag_and_drop_id
    	t.timestamps
    end
  end
end
