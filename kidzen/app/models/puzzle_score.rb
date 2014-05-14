class PuzzleScore < ActiveRecord::Base
  belongs_to :puzzle, foreign_key: 'puzzle_id'
  belongs_to :child, foreign_key: 'child_id'
end