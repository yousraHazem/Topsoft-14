class PollQuestionsController < ApplicationController
  before_action :set_poll_question, only: [:show, :edit, :update, :destroy]

  # GET /poll_questions
  # GET /poll_questions.json

  #list all questions
  def index
    @poll_questions = PollQuestion.all
  end

  # GET /poll_questions/1
  # GET /poll_questions/1.json
  def show
  end

  # GET /poll_questions/new
  # create new poll Question and 1 answer
  def new
    @poll_question = PollQuestion.new
    #creating a defult new answer
    @poll_question.poll_answers.build
  end

  # GET /poll_questions/1/edit
  def edit
  end

  # POST /poll_questions
  # POST /poll_questions.json
  #create poll with the questions and answers given by the user in the _form page
  def create
    @poll_question = PollQuestion.new(poll_question_params)

    respond_to do |format|
      if @poll_question.save
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
  def destroy
    @poll_question.destroy
    respond_to do |format|
      format.html { redirect_to poll_questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll_question
      @poll_question = PollQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_question_params
      params.require(:poll_question).permit(:content)
    end


    #strong parameters required for rails 4 
    def poll_question_params
      params.require(:poll_question).permit(:content, poll_answers_attributes: [:content, :_destroy]) 
    end

end
