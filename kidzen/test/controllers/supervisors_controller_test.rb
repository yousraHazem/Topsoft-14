require 'test_helper'

class SupervisorsControllerTest < ActionController::TestCase
  test "should get confirm_children" do
    get :confirm_children
    assert_response :success
  end

end
