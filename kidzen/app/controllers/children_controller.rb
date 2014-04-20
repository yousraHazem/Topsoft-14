# Authors: Ammar M. ELWazir, Shary Beshara, Ahmed H. Ismail
class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  # GET /children/1
  # GET /children/1.json
  def show
  end

  # GET /signup
  def signup 
    @errors = []
  end



  # Adds a new friendship entry.
  # First child invites second child
  # child_1 - first child.
  # child_2 - second child.
  # Authors: Ahmed H. Ismail.
  def create_friendship(child_1, child_2)
    # TODO remember notifcations and calling function in child
    # model to invite.
    Friendship.create_friendship(child_1, child_2)
  end


  # This method will set the variable is_approved to true to mark that 
  # this child has been approved.
  # Authors: Shary Beshara
  def verify
    @child.is_approved = true
  end 

  # POST /children
  # POST /children.json
  # Sign up Child
  # Sends a verification request to the email supplied.
  # Uses UserMailer to handle the email sending logic.
  # child_params - sign up text feilds
  # Authors: Ammar M. ElWazir, Shary Beshara, Ahmed H. Ismail
  def create 
    perms = Permission.child_default
    perms.save
    super_duper_params = signup_params
    registered_user_params = Hash.new
    registered_user_params[:first_name] = super_duper_params[:first_name]
    registered_user_params[:middle_name] = super_duper_params[:middle_name]
    registered_user_params[:family_name] = super_duper_params[:family_name]
    registered_user_params[:email] = super_duper_params[:email]
    registered_user_params[:gender] = super_duper_params[:gender]
    registered_user_params[:password] = super_duper_params[:password]
    registered_user_params[:password_confirmation] = super_duper_params[:password_confirmation]
    registered_user_params[:birth_date] = super_duper_params[:birth_date]
    registered_user_params[:user_name] = super_duper_params[:user_name]
    registered_user_params[:banned] = false
    registered_user_params[:permission] = perms
    Rails.logger.debug("registered_user_params: #{registered_user_params.inspect}")
    @user = RegisteredUser.new(registered_user_params)
    respond_to do |format| 
      if @user.save
        perms.registered_user = @user
        perms.save
        child_params = Hash.new
        child_params[:registered_user_id] = @user.id
        child_params[:guardian_email] = super_duper_params[:guardian_email]
        child_params[:is_approved] = false
        @child = Child.new(child_params)
        if @child.save
          sign_in @user # login
          # Send verification email
          UserMailer.account_verification(@child).deliver 
          flash[:success] = "Welcome to kidzen!!"
          format.html { redirect_to @user }
        else
          # failed on child params
          @user.destroy
          @perms.destroy
          @errors = @user.errors.full_messages
          format.json {render json: @errors}
          format.html { render :signup }
        end
      else
        perms.destroy
        format.json { render json: @user.errors.full_messages }
        @errors = @user.errors.full_messages
        format.html { render :signup}
      end
      
    end

  end

  # PATCH/PUT /children/1
  # PATCH/PUT /children/1.json
  # Update a child
  # child_params - sign up text feilds
  # Authors: Ammar M. ElWazir
  def update 
    respond_to do |format|
      if @child.update(child_params)
        format.html { redirect_to @child, notice: 'Child was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /children/1
  # DELETE /children/1.json
  # Delete a child
  # Authors: Ammar M. ElWazir
  def destroy 
    @child.destroy
    respond_to do |format|
      format.html { redirect_to children_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = Child.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # Authors: Ahmed H. Ismail
    def child_params
      params.require(:child).permit(:is_approved, :guardian_email, :registered_user_id)
    end

    def signup_params
      params.require(:child).permit(:first_name, :middle_name, :family_name, :gender, :birth_date, :email, :password, :password_confirmation, :username, :guardian_email)
    end
end
