require 'test_helper'
#This tests show of the Calendar and show wether it works or not
class CalendarControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
