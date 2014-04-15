# Authors: Ahmed H. Ismail, Shary Beshara
class ChildController < ApplicationController

  # Sends a verification request to the email supplied.
  # Uses UserMailer to handle the email sending logic.
  # Authors: Shary Beshara 
  def create
    @child=child
    UserMailer.account_verification(@child).deliver 
  end

# This method will set the variable is_approved to true to mark that 
# this child has been approved.
# Authors: Shary Beshara
  def verify
    @child.is_approved = true
  end 
    
  # Adds a new friendship entry.
  # child_1 - first child.
  # child_2 - second child.
  # Authors: Ahmed H. Ismail.
  def create_friendship(child_1, child_2)
    Friendship.create(child_1_id: child_1.id, child_2_id: child_2.id)
  end

end
