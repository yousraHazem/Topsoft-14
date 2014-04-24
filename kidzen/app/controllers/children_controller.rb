# Authors: Ammar M. ELWazir, Shary Beshara, Ahmed H. Ismail, Khaled I. Elhossiny
class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  # GET /children
  # GET /children.json
  def index
    @children = Child.all
  end

  # GET /children/1
  # GET /children/1.json
  def show
  end

  # GET /children/new
  def new 
    @child = Child.new
  end

  # GET /children/1/edit
  def edit
  end


  # Adds a new friendship entry.
  # First child invites second child
  # child_1 - first child.
  # child_2 - second child.
  # Authors: Ahmed H. Ismail.
  def create_friendship(child_1, child_2)
    #TODO remember notifcations and calling function in child
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
  # Authors: Ammar M. ElWazir, Shary Beshara 
  def create 
    @child = Child.new(child_params)
    UserMailer.account_verification(@child).deliver 
    respond_to do |format|
      else
      if @child.save
        format.html { redirect_to @child, notice: 'Child was successfully created.' }
        format.json { render action: 'show', status: :created, location: @child }
        format.html { render action: 'new' }
        format.json { render json: @child.errors, status: :unprocessable_entity }
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
  
  # Adds a new daily activity to the child.
  # child - the object of the child currently signed in.
  # daily_act - the daily activity the child wishes to add.
  # the method then add this daily activity to the child's daily activities.
  # redirects to controller and action that invoked this action.
  # Authors: Khaled I. Elhossiny.
   
  def add_daily_activity
    child = Child.where("registered_user_id=#{current_registered_user.id}").first
    daily_act = DailyActivity.create( :value => params[:value].to_i, :info => params[:info], :name => params[:name])
    child.daily_activities << daily_act
    flash[:notice] = "Successfully added daily activities"
    redirect_to( :controller => params[:cont], :action => params[:act])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = Child.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def child_params
      params.require(:child).permit(:approved, :guardian_email, :user_name, :password, :first_name, :birth_of_date, :gender)
    end
end
