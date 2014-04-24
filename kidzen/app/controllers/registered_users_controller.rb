class RegisteredUsersController < ApplicationController
 
 def show 

    if !signed_in? 
      # Login page
      # TODO: Change to guest home page when/if created
      redirect_to session_path :new
    
    else
      # Someone is signed in
      if Supervisor.exists?( registered_user: current_user)
        # Supervisor
        redirect_to controller: :supervisors, action: :show
      else 
        # Child
        redirect_to controller: :children, action: :show
      end

    end

  end

  # This method gets the attribute from the view and sends it to the
  # function in the model after checking the user is signed in
  # Authors: Shary Beshara
  def set_settings
      setting_params = params.require(:settings).permit(:notification_by_email)
     if signed_in?
        if Supervisor.exists?(registered_user: current_user)
              current_user.settings(setting_params[:notification_by_email])
              render :settings
        else
          flash[:failure] = "This isn't the page you are looking for.."
          redirect_to child_path :show
        end
      else
        flash[:failure] = "You have to be signed in"
        redirect_to session_path :new
      end

  end

  # This method show the view to the user without passing any attributes
  # Authors: Shary Beshara
  def settings
    if signed_in?
       if Supervisor.exists?(registered_user: current_user)

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
