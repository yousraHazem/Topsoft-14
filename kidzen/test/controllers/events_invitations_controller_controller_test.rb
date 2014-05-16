require 'test_helper'

class EventsInvitationsControllerControllerTest < ActionController::TestCase
  test "should get view_pending_event" do
    get :view_pending_event
    assert_response :success
  end

end
