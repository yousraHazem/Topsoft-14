# Supervisor controller
# Authors: Ahmed H. Ismail
class SupervisorsController < ApplicationController
  # before_action :set_supervisor, except: [] # set for all
  wrap_parameters format: [:json], include: [:child_username]

  # GET /confirm_children
  # Renders the confirm children
  # view.
  # Authors: Ahmed H. Ismail
  def confirm_children
    @children = @supervisor.pending_children
  end

  # GET /supervisors/dashboard
  # Renders the supervisor's homepage
  def show

  end
  
  # PUT /supervisor/reject_child
  # Accept child action.
  # Authors: Ahmed H. Ismail
  def accept_child
    respond_to do |format| 
      msg =  {status: "ok"}
      format.json { render json: msg }
      format.html { redirect_to  :confirm_children }
    end
  end

  # PUT /supervisor/accept_child
  # Reject child action.
  # Authors: Ahmed H. Ismail
  def reject_child
    respond_to do |format|
      msg = {status: "ok"}
      format.json { render json: msg }
      format.html { redirect_to :confirm_children }
    end
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
    @user = RegisteredUser.new(create_params)
    respond_to do |format|
      if @user.save
        params.registered_user = @user
        @supervisor = Supervisor.create(registered_user_id: @registered_user.id)
        sign_in @user
        format.json { render json: {status: "ok"} }
        flash[:success] = "Welcome to kidzen!!"
        format.html { redirect_to @supervisor }
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


end
