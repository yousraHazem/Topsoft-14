class ContentProvidersController < ApplicationController

  def show
    if signed_in?
      # Is user a supervisor?
      if ContentProvider.exists?(registered_user: current_user)
        @user = ContentProvider.find(current_user)
        # Render view
      end
    else
      # No one signed in
      redirect_to session_path :new
    end
  end
end
