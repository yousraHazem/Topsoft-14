class RegisteredUsersController < ApplicationController
  before_action :set_registered_user, only: [:show, :edit, :update, :destroy]

  # GET /registered_users
  # GET /registered_users.json
  def index
    @registered_users = RegisteredUser.all
  end

  # GET /registered_users/1
  # GET /registered_users/1.json
  def show
  end

  # GET /registered_users/new
  def new
    @registered_user = RegisteredUser.new
  end

  # GET /registered_users/1/edit
  def edit
  end

  # This function is wrong 
  # # This is a function that allows a user to leave a group
  # # Returns nothing
  # # Time complexity: O(1).
  # # Author: Mohamed Bahgat Elrakaiby
  #     def leave_group(RegisteredUser r)
  #         r.destroy
  #     end

  # POST /registered_users
  # POST /registered_users.json
  
  def create
    @registered_user = RegisteredUser.new(registered_user_params)
    @registered_user.banned = false

    respond_to do |format|
      if @registered_user.save
        
        
        if @registered_user.child?
          # Create Child
          # FIXME: Handle guardian_email
          Child.create(registered_user_id: @registered_user.id, is_approved: false, guardian_email: "WHAT DO I DO WIZ DIS")
        else 
          # Create Supervisor
          Supervisor.create(registered_user_id: @registered_user.id)
        end

        format.html { redirect_to @registered_user, notice: 'Registered user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @registered_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @registered_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registered_users/1
  # PATCH/PUT /registered_users/1.json
  def update
    respond_to do |format|
      if @registered_user.update(registered_user_params)
        format.html { redirect_to @registered_user, notice: 'Registered user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @registered_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registered_users/1
  # DELETE /registered_users/1.json
  def destroy
    @registered_user.destroy
    respond_to do |format|
      format.html { redirect_to registered_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registered_user
      @registered_user = RegisteredUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registered_user_params
      params.require(:registered_user).permit(:first_name, :middle_name, :family_name, :last_name, :gender, :is_child, :password, :password_confirmation, :nickname, :username, :email )
    end

end
