# The model representing 
# The FriendShip relation.
# Between two children
# Authors: Ahmed H. Ismail
class Friendship < ActiveRecord::Base
  # Associations
  belongs_to :child, foreign_key: 'child_1_id'
  belongs_to :child, foreign_key: 'child_2_id'
  # Validations
  validates :child_1_id, presence: true
  validates :child_2_id, presence: true
end
