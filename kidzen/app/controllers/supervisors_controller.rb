# Supervisor controller
# Authors: Ahmed H. Ismail
class SupervisorsController < ApplicationController
  # before_action :set_supervisor, except: [] # set for all

  # GET /confirm_children
  # Renders the confirm children
  # view.
  # Authors: Ahmed H. Ismail
  def confirm_children
    if signed_in?
      if Supervisor.exists?(registered_user_id: current_user.id)
        # set children and render 
        @children = Supervisor.find(current_user.id).pending_children
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
  def show
    if signed_in?
      # Is user a supervisor?
      if Supervisor.exists?(registered_user_id: current_user.id)
        @user = Supervisor.find(current_user.id)
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
    func = lambda { |supervisor, child | supervisor.accept_child(data) }
    associated_child_apply(func, data, :confirm_children)
  end

  # PUT /supervisor/accept_child
  # Reject child action.
  # Authors: Ahmed H. Ismail
  def reject_child
    data = params[:child_username]
    func = lambda { |supervisor, child | supervisor.reject_child(data) }
    associated_child_apply(func, data, :confirm_children)
  end


  # GET /supervisors/signup
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
        @supervisor = Supervisor.create(registered_user_id: @user.id, registered_user: @user)
        sign_in @user
        format.json { render json: {status: "ok"} }
        flash[:success] = "Welcome to kidzen!!"
        format.html { redirect_to @user }
      else
        perms.destroy
        format.json { render json: @registered_user.errors.full_messages }
        format.html { render :signup}
      end
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
    # fallback_action - symbol of action to redirect to, read only
    # renders JSON object with status set to ok or failure
    # redirects to fallback_action if html
    # Authors: Ahmed H. Ismail
    def associated_child_apply(func, child_username, fallback_action)
      respond_to do |format|
        if (!child_username.nill? ) and signed_in? and Supervisor.exists?(registered_user_id: current_user.id)
          begin
            supervisor = Supervisor.find(current_user.id)
            r_user_child = RegisteredUser.find_by(username: child_username)
            child = Child.find_by(registered_user_id: r_user_child.id)
            func(supervisor, child)
            msg =  {status: "ok"}
          rescue
            msg = {status: "failure"}
          end
          format.json { render json: msg }
          format.html { redirect_to  fallback_action }
        else
          msg = {status: "failure"}
          format.json { render json: msg }
          format.html { redirect_to  fallback_action }
        end
      end
    end

end
