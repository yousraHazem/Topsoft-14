# Authors: Ahmed H. Ismail
class ChildController < ApplicationController

  # Adds a new friendship entry.
  # child_1 - first child.
  # child_2 - second child.
  # Authors: Ahmed H. Ismail.
  def create_friendship(child_1, child_2)
    FriendShip.create(child_1_id: child_1.id, child_2_id: child_2.id)
  end

  def new
    UserMailer.account_verification.deliver #after creating the sign up we will pass the email
  end

  def verify
    @child.is_approved = true
  end 

  #Adds child username column and interest name column to childInterests table.
  #user_name - user's names.
  #interests_name - interests names.
  #Authors: Ahmad H. Elhamshary.
  def addInterests(user_name, interests_name)
	ChildInterests.create(child_username: user_name, interest_name: interest_name) 	
  end
  
  #Adds child username column and favorites name column to childFavorites table
  #user_name - user's names.
  #favorites_name - favorites names.
  #Authors: Ahmad H. Elhamshary.
  def addFavorites(user_name, favorites_name)
	ChildFavorites.create(child_username: user_name, favorites_name: favorites_name)  
  end

  #Adds child username column and hobbies name column to childHobbies table
  #user_name - user's names.
  #hobbies_name - hobbies names.
  #Authors: Ahmad H. Elhamshary.
  def addHobbies(user_name, hobbies_name)
	ChildHobbies.create(child_username: user_name, hobbies_name: hobbies_name)
  end

end
