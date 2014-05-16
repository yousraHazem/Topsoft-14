class NewSurveysController < ApplicationController
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  # This method is used to list all the surveys of a signed in user.
  # if the user is a child it will list all the surveys in the system.
  # if the user is a supervisor, it will list all surveys created by him.
  # Parameters : None.
  # Returns : None.
  # Author : Ahmad Bassiouny.
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

  # This method is used to get the data of a certain survey and show it.
  # Parameters : None.
  # Returns : None.
  # Author : Ahmad Bassiouny.
  def show
    if signed_in?
      @new_survey = NewSurvey.find(params[:id])
    else
      # No one signed in
      redirect_to session_path :new
    end
  end

  # This method is used to is used to recieve AJAX requests that come from
  # the javascript files. In order to use these data for insertion in database
  # in table Answer and PicModel.
  # Parameters : None.
  # Returns : None.
  # Author : Ahmad Bassiouny.
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

  # This method is used to show ONLY the result of the survey.
  # Parameters : None.
  # Returns : None.
  # Author : Ahmad Bassiouny.
  def show_super
    @new_survey = NewSurvey.find(params[:id])
  end

  # This method is used to create a new instance of a survey.
  # Parameters : None.
  # Returns : None.
  # Author : Ahmad Bassiouny.
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

  # This method is used to create a new survey using the values he entered in 
  # the _from and link the survey to the user by the user ID.
  # Parameters : None.
  # Returns : None.
  # Author : Ahmad Bassiouny.
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

  # This method is used to destroy a survey.
  # Parameters : None.
  # Returns : None.
  # Author : Ahmad Bassiouny.
  def destroy
    @new_survey = NewSurvey.find(params[:id])
    @new_survey.destroy
    respond_to do |format|
      format.html { redirect_to new_surveys_url }
      format.json { head :no_content }
    end
  end

  private
    # This method is used to prevent other attributes than the one i created.
    # Parameters : None.
    # Returns : None.
    # Author : Ahmad Bassiouny.
    def new_survey_params
      params.require(:new_survey).permit(:name, :user_id)
    end

    # This method is used to allow nestted attributes.
    # Parameters : None.
    # Returns : None.
    # Author : Ahmad Bassiouny.
    def new_survey_params
      params.require(:new_survey).permit(:name, :user_id, questions_attributes: [:content, :_destroy, answers_attributes: [:content, :_destroy], pic_models_attributes: [:pic_url, :_destroy], range_sliders_attributes: [:max, :min, :value, :_destroy], ranks_attributes: [:content, :_destroy]]) 
    end
end
