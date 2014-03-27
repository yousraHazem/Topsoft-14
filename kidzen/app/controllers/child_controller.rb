# Authors: Ahmed H. Ismail
class ChildController < ApplicationController
 
    before_action :set_child, only: [:show, :edit, :update, :destroy]

  # GET /Children
  # GET /Children.json
  def index
    @children = Child.all
  end

  # GET /Children/1
  # GET /Children/1.json
  def show
  end

  # GET /Children/new
  def new
    @child = Child.new
  end

  # GET /Children/1/edit
  def edit
  end

  # POST /Children
  # POST /Children.json
  def create
    @child = Child.new(child_params)

    respond_to do |format|
      if @child.save
        format.html { redirect_to @child, notice: 'Sign up was successfully created.' }
        format.json { render action: 'show', status: :created, location: @child }
      else
        format.html { render action: 'new' }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Children/1
  # PATCH/PUT /Children/1.json
  def update
    respond_to do |format|
      if @child.update(child_params)
        format.html { redirect_to @child, notice: 'Sign up was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Children/1
  # DELETE /Children/1.json
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
    def child_params
      params.require(:child).permit(:user_name, :password, :date_of_birth, :guardian_email, :email)
    end

    def create_friendship(child_1, child_2)
        FriendShip.create(child_1_id: child_1.id, child_2_id: child_2.id)
    end

    
end
