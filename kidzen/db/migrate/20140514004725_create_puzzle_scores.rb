class CreatePuzzleScores < ActiveRecord::Migration
  def change
    create_table :puzzle_scores do |t|
       t.integer :puzzle_id
       t.integer :child_id
       t.integer :moves
       t.integer :time
       t.integer :score
    end
  end
end
