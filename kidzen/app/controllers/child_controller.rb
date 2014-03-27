# Authors: Ahmed H. Ismail
class ChildController < ApplicationController

  # Adds a new friendship entry.
  # child_1 - first child.
  # child_2 - second child.
  # Authors: Ahmed H. Ismail.
  def create_friendship(child_1, child_2)
    FriendShip.create(child_1_id: child_1.id, child_2_id: child_2.id)
  end

    
end
