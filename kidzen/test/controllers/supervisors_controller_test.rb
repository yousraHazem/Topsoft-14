require 'test_helper'

class SupervisorsControllerTest < ActionController::TestCase
  setup do
    @supervisor = supervisors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supervisors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supervisor" do
    assert_difference('Supervisor.count') do
      post :create, supervisor: { address: @supervisor.address, personal_id: @supervisor.personal_id, phone_num: @supervisor.phone_num }
    end

    assert_redirected_to supervisor_path(assigns(:supervisor))
  end

  test "should show supervisor" do
    get :show, id: @supervisor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supervisor
    assert_response :success
  end

  test "should update supervisor" do
    patch :update, id: @supervisor, supervisor: { address: @supervisor.address, personal_id: @supervisor.personal_id, phone_num: @supervisor.phone_num }
    assert_redirected_to supervisor_path(assigns(:supervisor))
  end

  test "should destroy supervisor" do
    assert_difference('Supervisor.count', -1) do
      delete :destroy, id: @supervisor
    end

    assert_redirected_to supervisors_path
  end
end
