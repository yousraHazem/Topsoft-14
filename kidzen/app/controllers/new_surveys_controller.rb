class NewSurveysController < ApplicationController
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  # GET /new_surveys
  # GET /new_surveys.json
  def index
    if signed_in?
      # Is user a supervisor?
      if Child.exists?(registered_user_id: current_user.id)
        @new_surveys = NewSurvey.all
      else
        # Must be a supervisor.
        @new_surveys = NewSurvey.find_all_by_user_id current_user.id
      end
    else
      # No one signed in
      redirect_to session_path :new
    end
  end

  # GET /new_surveys/1
  # GET /new_surveys/1.json
  def show
    if signed_in?
      # Is user a supervisor?
      if Child.exists?(registered_user_id: current_user.id)
        @new_survey = NewSurvey.find(params[:id])
      else
        # Must be a supervisor.
        @new_survey = NewSurvey.find(params[:id])
        if @new_survey.user_id == current_user.id
          @new_surveys = NewSurvey.find_all_by_user_id current_user.id
        else
          redirect_to session_path :new
        end
      end
    else
      # No one signed in
      redirect_to session_path :new
    end
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

  def show_super
    @new_survey = NewSurvey.find(params[:id])
  end

  # GET /new_surveys/new
  def new
    if signed_in?
      # Is user a supervisor?
      if Child.exists?(registered_user_id: current_user.id)
        redirect_to child_path :show
      else
        # Must be a supervisor.
        @new_survey = NewSurvey.new
      end
    else
      # No one signed in
      redirect_to session_path :new
    end
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
        @new_survey.update_column(:user_id, current_user.id)
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
    def new_survey_params
      params.require(:new_survey).permit(:name, :user_id)
    end

    def new_survey_params
      params.require(:new_survey).permit(:name, :user_id, questions_attributes: [:content, :_destroy, answers_attributes: [:content, :_destroy], pic_models_attributes: [:pic_url, :_destroy], range_sliders_attributes: [:max, :min, :value, :_destroy], ranks_attributes: [:content, :_destroy]]) 
    end
end
