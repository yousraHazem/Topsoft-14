require 'test_helper'

class EventsInvitationsControllerTest < ActionController::TestCase
  test "should get event_invitation" do
    get :event_invitation
    assert_response :success
  end

end
