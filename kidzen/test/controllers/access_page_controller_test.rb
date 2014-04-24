require 'test_helper'

class AccessPageControllerTest < ActionController::TestCase
  test "should get access" do
    get :access
    assert_response :success
  end

end
