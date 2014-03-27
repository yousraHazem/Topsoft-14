class SupervisorsController < ApplicationController
  before_action :set_supervisor, only: [:show, :edit, :update, :destroy]

  # GET /supervisors
  # GET /supervisors.json
  def index
    @supervisors = Supervisor.all
  end

  # GET /supervisors/1
  # GET /supervisors/1.json
  def show
  end

  # GET /supervisors/new
  def new
    @supervisor = Supervisor.new
  end

  # GET /supervisors/1/edit
  def edit
  end
  
  # Author : Radwan A. Shrief
  # A method to return to the activities done by shild for the supervisor of a given child
  def notifyChildActivity
  end

  # Author : Radwan A. Shrief  
  # A method to check if this superviser is the guardian of a given child
  def guardiantOf?
  end

  # Author : Radwan A. Shrief  
  # A method to check if this superviser is the supervisor of a given child
  def superVisorOf?
  end
  
  # Author : Radwan A. Shrief
  # A method to check the condition of a given  child
  def getCondition
  end
  

  # Author : Radwan A. Shrief
  # A method to set the condition of a given  child
  def setCondition
  end
  
  # Author : Radwan A. Shrief
  # A method for approving the creation of a child's account
  def approve
  end
  
  # Author : Radwan A. Shrief
  # A method for changing the legal guardian
  def exchangeLegalG
  end
  
  # Author : Radwan A. Shrief
  # A method for adding a child in the responsibility of  this supervisor
  def addChild
  end
  
  # Author : Radwan A. Shrief
  # A metod to move the responsibility of a child from a supervisor to another one
  def moveChild
  end

  # POST /supervisors
  # POST /supervisors.json
  def create
    @supervisor = Supervisor.new(supervisor_params)

    respond_to do |format|
      if @supervisor.save
        format.html { redirect_to @supervisor, notice: 'Supervisor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @supervisor }
      else
        format.html { render action: 'new' }
        format.json { render json: @supervisor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supervisors/1
  # PATCH/PUT /supervisors/1.json
  def update
    respond_to do |format|
      if @supervisor.update(supervisor_params)
        format.html { redirect_to @supervisor, notice: 'Supervisor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @supervisor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supervisors/1
  # DELETE /supervisors/1.json
  def destroy
    @supervisor.destroy
    respond_to do |format|
      format.html { redirect_to supervisors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supervisor
      @supervisor = Supervisor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supervisor_params
      params.require(:supervisor).permit(:personal_id, :phone_num, :address)
    end
end
