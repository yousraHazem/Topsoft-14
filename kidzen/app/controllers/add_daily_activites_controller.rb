class AddDailyActivitesController < ApplicationController
  before_action :set_add_daily_activite, only: [:show, :edit, :update, :destroy]

  # GET /add_daily_activites
  # GET /add_daily_activites.json
  def index
    @add_daily_activites = AddDailyActivite.all
  end

  # GET /add_daily_activites/1
  # GET /add_daily_activites/1.json
  def show
  end

  # GET /add_daily_activites/new
  def new
    @add_daily_activite = AddDailyActivite.new
  end

  # GET /add_daily_activites/1/edit
  def edit
  end

  # POST /add_daily_activites
  # POST /add_daily_activites.json
  def create
    @add_daily_activite = AddDailyActivite.new(add_daily_activite_params)

    respond_to do |format|
      if @add_daily_activite.save
        format.html { redirect_to @add_daily_activite, notice: 'Add daily activite was successfully created.' }
        format.json { render action: 'show', status: :created, location: @add_daily_activite }
      else
        format.html { render action: 'new' }
        format.json { render json: @add_daily_activite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /add_daily_activites/1
  # PATCH/PUT /add_daily_activites/1.json
  def update
    respond_to do |format|
      if @add_daily_activite.update(add_daily_activite_params)
        format.html { redirect_to @add_daily_activite, notice: 'Add daily activite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @add_daily_activite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /add_daily_activites/1
  # DELETE /add_daily_activites/1.json
  def destroy
    @add_daily_activite.destroy
    respond_to do |format|
      format.html { redirect_to add_daily_activites_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_add_daily_activite
      @add_daily_activite = AddDailyActivite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def add_daily_activite_params
      params.require(:add_daily_activite).permit(:child_id, :activity)
    end
end
