# This is PuzzleScore Model that is used to save scores of the child
# Author : Moaz El-Nashar
class PuzzleScore < ActiveRecord::Base
  belongs_to :puzzle, foreign_key: 'puzzle_id'
  belongs_to :child, foreign_key: 'child_id'
end