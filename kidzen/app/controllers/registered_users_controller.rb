class RegisteredUsersController < ApplicationController

  # Authors: Ammar ELWazeer
  # save the user in @profile_owner to use it to view the profile while the username is the one taken from the url.
  def show_user 
    @profile_owner = RegisteredUser.where(:username=>params[:username]).first

  end
 
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
