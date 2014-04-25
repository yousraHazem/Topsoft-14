class PollQuestionsController < ApplicationController
  before_action :set_poll_question, only: [:show, :edit, :update, :destroy]

  # GET /poll_questions
  # GET /poll_questions.json
  #list all questions of the current loged in user
  #Parameters : non
  #complixty : O(n)
  #return non
  #Author : Ahmad Bassiouny
  def index
    if signed_in?
      # Is user a supervisor?
      if Child.exists?(registered_user_id: current_user.id)
        @user = Child.find_by(registered_user_id: current_user.id)
        @poll_questions = PollQuestion.find_all_by_user_id current_user.id
      else
        # Must be a supervisor.
        @poll_questions = PollQuestion.find_all_by_user_id current_user.id
      end
    else
      # No one signed in
      redirect_to session_path :new
    end
  end

  # GET /poll_questions/1
  # GET /poll_questions/1.json
  def show
  end

  # GET /poll_questions/new
  # create new poll Question and 1 answer after checking if the user is a 
  # logged in child or not
  ##complixty : O(n)
  #Parameters : non
  #return non
  #Author : Ahmad Bassiouny
  def new
    if signed_in?
      # Is user a supervisor?
      if Child.exists?(registered_user_id: current_user.id)
        @user = Child.find_by(registered_user_id: current_user.id)
        @poll_question = PollQuestion.new
        #creating a defult new answer
        @poll_question.poll_answers.build
      else
        # Must be a supervisor.
        @poll_question = PollQuestion.new
        #creating a defult new answer
        @poll_question.poll_answers.build
      end
    else
      # No one signed in
      redirect_to session_path :new
    end
  end

  # GET /poll_questions/1/edit
  def edit
  end

  # POST /poll_questions
  # POST /poll_questions.json
  #create poll with the questions and answers given by the user in the _form page
  # #complixty : O(n)
  #Parameters : non
  #return : redirect to the show page or the new page
  #Author : Ahmad Bassiouny
  def create
    @poll_question = PollQuestion.new(poll_question_params)

    respond_to do |format|
      if @poll_question.save
         #update the question's user id column with the current user id 
         @poll_question.update_column(:user_id, current_user.id)
         format.html { redirect_to @poll_question, notice: 'Poll question was successfully created.' }
         format.json { render action: 'show', status: :created, location: @poll_question }
      else
         format.html { render action: 'new' }
         format.json { render json: @poll_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poll_questions/1
  # PATCH/PUT /poll_questions/1.json
  # update an exciting poll 
  # complixty : O(n)
  #Parameters : non
  #return : redirect to the show or edit page
  #Author : Ahmad Bassiouny
  def update
    respond_to do |format|
      if @poll_question.update(poll_question_params)
        format.html { redirect_to @poll_question, notice: 'Poll question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @poll_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poll_questions/1
  # DELETE /poll_questions/1.json
  # delete poll
  #Parameters : non
  #return : redirect to index page
  #Author : Ahmad Bassiouny
  ##complixty : O(n)
  def destroy
    @poll_question.destroy
    respond_to do |format|
      format.html { redirect_to poll_questions_url }
      format.json { head :no_content }
    end
  end

  private
  #Parameters : :id
  #return : Poll Question object
  #Author : Ahmad Bassiouny
  #complixty : O(1)
  # Use callbacks to share common setup or constraints between actions.
    def set_poll_question
      @poll_question = PollQuestion.find(params[:id])
    end

    
    #Parameters : __
    #return : __
    #Author : Ahmad Bassiouny
    #complixty : O(1)
    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_question_params
      params.require(:poll_question).permit(:content, :user_id)
    end


    #strong parameters required for rails 4 
    #Parameters : __
    #return : __
    #Author : Ahmad Bassiouny
    #complixty : O(1)
    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_question_params
      params.require(:poll_question).permit(:content, :user_id, poll_answers_attributes: [:content, :_destroy]) 
    end

end
