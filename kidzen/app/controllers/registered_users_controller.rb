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

  # This method gets the attribute from the view and sends it to the 
  # function in the model 
  # Authors: Shary Beshara
  def settings
     if signed_in?
        if Supervisor.exists?(registered_user: current_user)
              current_user.settings(params[:notification_by_email])
        else
          flash[:failure] = "This isn't the page you are looking for.."
          redirect_to child_path :show
        end
      else
        flash[:failure] = "You have to be signed in"
        redirect_to session_path :new
      end

  end

end
