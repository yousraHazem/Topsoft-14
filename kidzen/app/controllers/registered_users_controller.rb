# Controller for RegisteredUsers
# Authors: Ahmed H. Ismail
class RegisteredUsersController < ApplicationController
 

 # GET /registered_user
 # GET /profile
 # Redirects to the profile page of the currently
 # logged in user. 
 # Authors: Ahmed H. Ismail
 def show 
    if !signed_in? 
      # Login page
      # TODO: Change to guest home page when/if created
      redirect_to session_path :new    
    else
      # Someone is signed in
      if Supervisor.exists?( registered_user: current_user)
        # Redirect to Supervisor
        redirect_to controller: :supervisors, action: :show
      else 
        # Redirect to Child
        redirect_to controller: :children, action: :show
      end
    end
  end

end
