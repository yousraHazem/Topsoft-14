# Supervisor controller
# Authors: Ahmed H. Ismail
class SupervisorsController < ApplicationController  
  # TODO: fix 'X-CSRF-Token' in XMLHttpRequest header
  skip_before_filter :verify_authenticity_token, only: [:accept_child, :reject_child]
  
  # GET /confirm_children
  # Renders the confirm children
  # view.
  # Authors: Ahmed H. Ismail
  def confirm_children
    if signed_in?
      if Supervisor.exists?(registered_user: current_user)
        # set children and render 
        @children = Supervisor.find(current_user).pending_children
      else
        # Child can't access this page
        flash[:failure] = "This isn't the page you are looking for.."
        redirect_to child_path :show
      end
    else
      flash[:failure] = "You have to be signed in"
      redirect_to session_path :new
    end
  end

  # GET /supervisors/dashboard
  # Renders the supervisor's homepage
  # Authors: Ahmed H. Ismail
  def show
    if signed_in?
      # Is user a supervisor?
      if Supervisor.exists?(registered_user: current_user)
        @user = Supervisor.find(current_user)
        # Render view
      else
         # Must be a child.
        redirect_to child_path :show
      end
    else
      # No one signed in
      redirect_to session_path :new
    end
  end
  
  # PUT /supervisor/reject_child
  # Accept child action.
  # Authors: Ahmed H. Ismail
  def accept_child
    data = params[:child_username]
    func = lambda { |supervisor, child | supervisor.accept_child(child) }
    associated_child_apply(func, data)
  end

  # PUT /supervisor/accept_childBeshara
  # Reject child action.
  # Authors: Ahmed H. Ismail
  def reject_child
    data = params[:child_username]
    func = lambda { |supervisor, child | supervisor.reject_child(child) }
    associated_child_apply(func, data)
  end


  # GET /supervisors/signup
  # Renders the signup page
  # Authors: Ahmed H. Ismail
  def signup
    @user = RegisteredUser.new
  end

  # POST /supervisors/create
  # Creates a new supervisor
  # Authors: Ahmed H. Ismail
  def create
    perms = Permission.supervisor_default
    perms.save
    create_params = signup_params
    create_params[:banned] = false
    create_params[:permission] = perms
    Rails.logger.debug("create_params: #{create_params.inspect}")
    @user = RegisteredUser.new(create_params)
    respond_to do |format|
      if @user.save
        perms.registered_user = @user
        perms.save
        @supervisor = Supervisor.create(registered_user: @user)
        sign_in @user
        format.json { render json: {status: "ok"} }
        flash[:success] = "Welcome to kidzen!!"
        format.html { redirect_to @user }
      else
        perms.destroy
        format.json { render json: @user.errors.full_messages }
        format.html { render :signup}
      end
    end

  end

    # This method gets email and supervisor id from the view and find the 
    # corresponding supervisor which it paas them to the user_mailer method 
    # after checking that the supervisor is signed in  
    # email - is the email that the invitation should be sent to 
    # that passed by the views
    # Authors: Shary Beshara
    def invite
      if signed_in?
        if Supervisor.exists?(registered_user: current_user)
          @supervisor = current_user
          @email = params[:email]
          if !RegisteredUser.exists?(email: <email here>)
            UserMailer.invite_others(@email, @supervisor).deliver 
          end
        else
          flash[:failure] = "This isn't the page you are looking for.."
          redirect_to child_path :show
        end
      else
        flash[:failure] = "You have to be signed in"
        redirect_to session_path :new
      end
    end


  private

    # Safety first.
    # Authors Ahmed H. Ismail
    def signup_params
      params.require(:registered_user).permit(:first_name, :middle_name, :family_name, :gender, :birth_date, :email, :password, :password_confirmation, :username)
    end

    # Helper function that finds a child by username and calles a function
    # with the currently signed in supervisor and the child as the params
    # func - function to call called as func(signed_in_supervisor, child_found_by_username)
    # child_username - the child's username, read only
    # renders JSON object with status set to ok or failure
    # renders none if html
    # Authors: Ahmed H. Ismail
    def associated_child_apply(func, child_username)
      respond_to do |format|
        if (!child_username.nil? ) and signed_in? and Supervisor.exists?(registered_user: current_user)
          begin
            supervisor = Supervisor.find(current_user)
            r_user_child = RegisteredUser.find_by(username: child_username)
            child = Child.find_by(registered_user: r_user_child)
            func.call(supervisor, child)
            msg =  {status: "ok"}
          rescue
            msg = {status: "failure"}
          end
          format.json { render json: msg }
          format.html { render layout: false, nothing: true }
        else
          msg = {status: "failure"}
          format.json { render json: msg }
          format.html { render layout: false, nothing: true }
        end
      end
    end
end
