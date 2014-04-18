# Authors: Ammar M. ELWazir
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

  # POST /children
  # POST /children.json
  # Sign up Child
  # child_params - sign up text feilds
  # Authors: Ammar M. ElWazir
  def create 
    @child = Child.new(child_params)

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
