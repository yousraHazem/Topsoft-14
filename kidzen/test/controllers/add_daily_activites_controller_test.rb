require 'test_helper'

class AddDailyActivitesControllerTest < ActionController::TestCase
  setup do
    @add_daily_activite = add_daily_activites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:add_daily_activites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create add_daily_activite" do
    assert_difference('AddDailyActivite.count') do
      post :create, add_daily_activite: { activity: @add_daily_activite.activity, child_id: @add_daily_activite.child_id }
    end

    assert_redirected_to add_daily_activite_path(assigns(:add_daily_activite))
  end

  test "should show add_daily_activite" do
    get :show, id: @add_daily_activite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @add_daily_activite
    assert_response :success
  end

  test "should update add_daily_activite" do
    patch :update, id: @add_daily_activite, add_daily_activite: { activity: @add_daily_activite.activity, child_id: @add_daily_activite.child_id }
    assert_redirected_to add_daily_activite_path(assigns(:add_daily_activite))
  end

  test "should destroy add_daily_activite" do
    assert_difference('AddDailyActivite.count', -1) do
      delete :destroy, id: @add_daily_activite
    end

    assert_redirected_to add_daily_activites_path
  end
end
