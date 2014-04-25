# Controller for RegisteredUsers
# Authors: Ahmed H. Ismail
class RegisteredUsersController < ApplicationController

  # save the user in @profile_owner to use it to view the profile while the username is the one taken from the url.
  # username will be the same as in the url /show/"username", profile_owner will be the registered_user with the username.
  # Authors: Ammar ELWazeer
  def show_user 
    @profile_owner = RegisteredUser.where(:username=>params[:username]).first

  end
 

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
