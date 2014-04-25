require 'test_helper'

class PollQuestionsControllerTest < ActionController::TestCase
  setup do
    @poll_question = poll_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:poll_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poll_question" do
    assert_difference('PollQuestion.count') do
      post :create, poll_question: { content: @poll_question.content }
    end

    assert_redirected_to poll_question_path(assigns(:poll_question))
  end

  test "should show poll_question" do
    get :show, id: @poll_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @poll_question
    assert_response :success
  end

  test "should update poll_question" do
    patch :update, id: @poll_question, poll_question: { content: @poll_question.content }
    assert_redirected_to poll_question_path(assigns(:poll_question))
  end

  test "should destroy poll_question" do
    assert_difference('PollQuestion.count', -1) do
      delete :destroy, id: @poll_question
    end

    assert_redirected_to poll_questions_path
  end
end
