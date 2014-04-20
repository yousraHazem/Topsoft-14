class RegisteredUsersController < ApplicationController
 
 def show 

    if !signed_in? 
      # Login page
      # TODO: Change to guest home page when/if created
      redirect_to session_path :new
    
    else
      # Someone is signed in
      if Supervisor.exists?( registered_user_id: current_user.id)
        # Supervisor
        redirect_to controller: :supervisors, action: :show
      else 
        # Child
        redirect_to controller: :children, action: :show
      end

    end

  end

end
