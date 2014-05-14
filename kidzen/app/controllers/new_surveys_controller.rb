class NewSurveysController < ApplicationController
  before_action :set_new_survey, only: [:show, :edit, :update, :destroy]

  # GET /new_surveys
  # GET /new_surveys.json
  def index
    @new_surveys = NewSurvey.all
  end

  # GET /new_surveys/1
  # GET /new_surveys/1.json
  def show
  end

  def submit
  end

  # GET /new_surveys/new
  def new
    @new_survey = NewSurvey.new
  end

  # GET /new_surveys/1/edit
  def edit
  end

  # POST /new_surveys
  # POST /new_surveys.json
  def create
    @new_survey = NewSurvey.new(new_survey_params)

    respond_to do |format|
      if @new_survey.save
        format.html { redirect_to @new_survey, notice: 'New survey was successfully created.' }
        format.json { render action: 'show', status: :created, location: @new_survey }
      else
        format.html { render action: 'new' }
        format.json { render json: @new_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /new_surveys/1
  # PATCH/PUT /new_surveys/1.json
  def update
    respond_to do |format|
      if @new_survey.update(new_survey_params)
        format.html { redirect_to @new_survey, notice: 'New survey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @new_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new_surveys/1
  # DELETE /new_surveys/1.json
  def destroy
    @new_survey.destroy
    respond_to do |format|
      format.html { redirect_to new_surveys_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_survey
      @new_survey = NewSurvey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_survey_params
      params.require(:new_survey).permit(:name, :user_id)
    end

    def new_survey_params
      params.require(:new_survey).permit(:name, :user_id, questions_attributes: [:content, :_destroy, answers_attributes: [:content, :_destroy], pic_models_attributes: [:pic_url, :_destroy], range_sliders_attributes: [:max, :min, :value, :_destroy], ranks_attributes: [:content, :_destroy]]) 
    end
end
