# Authors: Ahmed H. Ismail, Shary Beshara
class ChildController < ApplicationController

# inside creating the child there will be a method to call another method 
# inside the user_mailer passing to it the child as an object 
  def create
    @child=child
    UserMailer.account_verification(@child).deliver 
  end

  def create_friendship(child_1, child_2)
    FriendShip.create(child_1_id: child_1.id, child_2_id: child_2.id)
  end

# this method will set the variable is_approved to true as to show that the 
# parent had verified this child
  def verify
    @child.is_approved = true
  end 
    

end
