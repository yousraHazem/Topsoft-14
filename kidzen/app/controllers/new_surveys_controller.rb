class NewSurveysController < ApplicationController
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  # GET /new_surveys
  # GET /new_surveys.json
  def index
    @new_surveys = NewSurvey.all
  end

  # GET /new_surveys/1
  # GET /new_surveys/1.json
  def show
    @new_survey = NewSurvey.find(params[:id])
  end

  def submit
    @data = params[:arrays]
    @data.each do |element|
      @first_answer = Answer.find_by_content element
      if @first_answer
        m = @first_answer.votes
        m = m.to_i + 1
        @first_answer.update_attributes votes: m
      end
      @second_answer = PicModel.find_by_pic_url element
      if @second_answer
        m = @second_answer.votes
        m = m.to_i + 1
        @second_answer.update_attributes votes: m
      end
    end
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

  # DELETE /new_surveys/1
  # DELETE /new_surveys/1.json
  def destroy
    @new_survey = NewSurvey.find(params[:id])
    @new_survey.destroy
    respond_to do |format|
      format.html { redirect_to new_surveys_url }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def new_survey_params
      params.require(:new_survey).permit(:name, :user_id)
    end

    def new_survey_params
      params.require(:new_survey).permit(:name, :user_id, questions_attributes: [:content, :_destroy, answers_attributes: [:content, :_destroy], pic_models_attributes: [:pic_url, :_destroy], range_sliders_attributes: [:max, :min, :value, :_destroy], ranks_attributes: [:content, :_destroy]]) 
    end
end
