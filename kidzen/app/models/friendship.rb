# The model representing 
# The FriendShip relation.
# Between two children
# Authors: Ahmed H. Ismail
class Friendship < ActiveRecord::Base
  # Associations
  belongs_to :child, :class_name => 'Child', :foreign_key =>'child_1_id'
  belongs_to :friend, :class_name => 'Child', :foreign_key =>'child_2_id'
  # Validations
  validates :child_1_id, presence: true
  validates :child_2_id, presence: true



      
  # Adds a new friendship entry.
  # child_1 - first child.
  # child_2 - second child.
  # Authors: Ahmed H. Ismail.
  def create_friendship(child_1, child_2)
    Friendship.create(child_1_id: child_1.id, child_2_id: child_2.id)
  end

end
