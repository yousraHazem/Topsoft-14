require 'exceptions'
# Authors: Ammar M. ELWazir, Shary Beshara, Ahmed H. Ismail
class ChildrenController < ApplicationController

  # GET /children/show
  # Shows the currently logged in user's 
  # Profile if he/she is a child
  # Otherwise redirects to same action
  # In supervisors controller
  # Authors: Ahmed H. Ismail
  def show
    if signed_in?
      # Is user a supervisor?
      if Child.exists?(registered_user: current_user)
        @user = Child.find_by(registered_user: current_user)
        # Render view
      else
        # Must be a supervisor.
        redirect_to controller: :supervisors, action: :show
      end
    else
      # No one signed in
      redirect_to session_path :new
    end
  end

  # GET /signup
  # Renders the signup page for
  # Children.
  # Authors Ahmed H. Ismail
  def signup 
    @errors = [] # Populated by errors by create.
  end


  # This method will set the variable is_approved to true to mark that 
  # this child has been approved.
  # Authors: Shary Beshara
  def verify
    @child_account.is_approved = true
  end 


  # POST /children/create
  # Sign up Child
  # Sends a verification request to the email supplied.
  # Uses UserMailer to handle the email sending logic.
  # child_params - sign up text feilds
  # Authors: Ammar M. ElWazir, Shary Beshara, Ahmed H. Ismail
  def create    
    respond_to do |format|
      begin       
        @user = RegisteredUser.new(registered_user_params)

        raise RegisteredUserParamsError(@user.inspect) if not @user.save
        # registered user fields ok.
        # Finalize perms
        perms = Permission.child_default(@user)
        raise PermissionParamsError(registered_user_params.inspect) if not perms.save
        @child_account = Child.new(child_params(@user))
        raise ChildParamsError(@child_account.inspect) if not @child_account.save
        sign_in @user # login
        # Send verification email
        UserMailer.account_verification(@child_account).deliver 
        # Send notification to parent
        if RegisteredUser.exists?(email: @child_account.guardian_email)
          parent = Supervisor.find(RegisteredUser.find_by(email: @child_account.guardian_email))
          parent.notify_child_created(@child_account)
        end
        flash[:success] = "Welcome to kidzen!!"
        format.html { redirect_to @user }
      rescue RegisteredUserParamsError: rpe
        format.json { render json: @user.errors.full_messages }
        @errors = @user.errors.full_messages
        format.html { render :signup}
      rescue PermissionParamsError: ppe
        format.json { render json: {status: "failed"} }
        format.html {render file: File.join(Rails.root, 'public/500.html'), status: 500, layout: false }
      rescue ChildParamsError: cpe
        @errors = @child_account.errors.full_messages
        @user.destory
        format.json {render json: @errors}
        format.html { render :signup }
      end      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child_account = Child.find(params[:id])
    end

    def signup_params
      params.require(:child).permit(:first_name, :middle_name, :family_name, :gender, "birth_date(1i)", "birth_date(2i)", "birth_date(3i)", :email, :password, :password_confirmation, :username, :guardian_email)
    end

    # Grabs Child specific params from signup params.
    # Returns has containing the attributes for Child.
    # Authors: Ahmed H. Ismail
    def child_params(user) 
      c_params = Hash.new
      # Unpack child params
      c_params[:registered_user] = user
      c_params[:guardian_email] = signup_params[:guardian_email]
      c_params[:is_approved] = false
      return c_params
    end

    # Grabs registered_user params from signup_params.
    # Returns hash containing attributes for RegisteredUser.
    # Authors: Ahmed H. Ismail.
    def registered_user_params
      super_duper_params = signup_params
      ru_params = Hash.new
      ru_params[:first_name] = super_duper_params[:first_name]
      ru_params[:middle_name] = super_duper_params[:middle_name]
      ru_params[:family_name] = super_duper_params[:family_name]
      ru_params[:email] = super_duper_params[:email]
      ru_params[:gender] = super_duper_params[:gender]
      ru_params[:password] = super_duper_params[:password]
      ru_params[:password_confirmation] = super_duper_params[:password_confirmation]
      # Set up Date
      year = super_duper_params["birth_date(1i)"].to_i
      month = super_duper_params["birth_date(2i)"].to_i
      day = super_duper_params["birth_date(3i)"].to_i
      # Set Date
      ru_params[:birth_date] = Date.new(year, month, day)
      # More registered user params
      ru_params[:username] = super_duper_params[:username]
      ru_params[:banned] = false
      return ru_params
    end
    
end
