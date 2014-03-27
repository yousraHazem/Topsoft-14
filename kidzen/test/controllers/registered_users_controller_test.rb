require 'test_helper'

class RegisteredUsersControllerTest < ActionController::TestCase
  setup do
    @registered_user = registered_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registered_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registered_user" do
    assert_difference('RegisteredUser.count') do
      post :create, registered_user: {  }
    end

    assert_redirected_to registered_user_path(assigns(:registered_user))
  end

  test "should show registered_user" do
    get :show, id: @registered_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registered_user
    assert_response :success
  end

  test "should update registered_user" do
    patch :update, id: @registered_user, registered_user: {  }
    assert_redirected_to registered_user_path(assigns(:registered_user))
  end

  test "should destroy registered_user" do
    assert_difference('RegisteredUser.count', -1) do
      delete :destroy, id: @registered_user
    end

    assert_redirected_to registered_users_path
  end
end
