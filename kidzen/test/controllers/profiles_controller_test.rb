require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get supervisor" do
    get :supervisor
    assert_response :success
  end

end
