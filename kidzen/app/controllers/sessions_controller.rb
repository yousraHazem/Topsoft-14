# Controller for user Sessions
# Authors: Ahmed H. Ismail
class SessionsController < ApplicationController

  # GET /signin
  # Renders signin form
  # Authors: Ahmed H. Ismail
  def new
  end

  # POST /sessions
  # Creates a new session
  # Authors: Ahmed H. Ismail
  def create
    user = RegisteredUser.find_by(email: params[:session][:email].downcase )
    if user and user.authenticate(params[:session][:password])
      # Sign in user
      sign_in user
      redirect_to user
    else
      # Display error page and redirect
      flash.now[:signin_error] = 'Invalid email/password'
      render :new
    end
    
  end

  # DELETE /signout
  # Logs out a user
  # Authors: Ahmed H. Ismail
  def destroy
    sign_out
    # TODO: Change this to home page/default for guests
    redirect_to :new
  end

end
