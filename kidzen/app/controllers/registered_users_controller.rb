class RegisteredUsersController < ApplicationController
 
 def show 

    if !signed_in? 
      # Login page
      # TODO: Change to guest home page when/if created
      redirect_to session_path :new
    
    else
      # Someone is signed in
      if Supervisor.find(current_user.id)
        # Supervisor
        redirect_to supervisor_path :show
      else 
        # Child
        redirect_to child_path :show
      end

    end

  end

end
