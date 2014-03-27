require 'test_helper'

class AccessControllerTest < ActionController::TestCase
  test "should get access" do
    get :access
    assert_response :success
  end

end
