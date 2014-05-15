class EventsInvitationsController < ApplicationController

  def index

  end
  
  def view_my_friends

  end
 
 # This method to provide the child with a list of pending events.
 # child - an object of the child currently signed in.
 # @pending_events - active record of children.
 # Returns @pending_events which is the active record of the child's pending events.
 # Time complexity: O(n).
 #Authors: Nouran Mamdouh.

  def view_pending_event_requests
    child = Child.where("registered_user_id=#{current_user.id}").first
    @pending_events = child.pending_events
  end
 
  def send_event_request

  end
end
 # This method to provide the child with the decision to either accept or reject pending event requests.
 # is_accepted - integer represents accepting or rejection of the pending event request.
 # rec1 - active record of the pending event request that is accepted.
 # rec2 - active record of the requested event request that is accepted.
 # destroyed_event_request - active record of the pending event request that is rejected.
 # redirects to the pending event requests view after either accepting or rejecting a pending event request .
 # Time complexity: O(n).
 #Authors: Nouran Mamdouh.

  def accept_reject_event_request
    is_accepted = params[:status].to_i
    if is_accepted == 1
      rec1 = EventInvitation.where("child_1_id=#{current_user.id} AND child_2_id=#{params[:inviter]}").update_all(status:"accepted")
      rec2 = EventInvitation.where("child_1_id=#{params[:inviter]} AND child_2_id=#{current_user.id}").update_all(status:"accepted")
      flash[:notice] = "Event request successfully accepted"
    else
      destroyed_event_request = EventInvitation.delete_all("child_1_id=#{current_user.id} AND child_2_id=#{params[:friend_id]}")
      flash[:notice] = "Event request successfully rejected"
    end
    redirect_to( :controller => 'events_invitations_controller', :action => 'view_pending_event_requests')
  end

end