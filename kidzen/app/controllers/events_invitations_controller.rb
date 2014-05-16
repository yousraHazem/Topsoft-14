class EventsInvitationsController < ApplicationController
  # This method to send a event request.
  # user_id - the id of the child currently signed in.
  # pending_event - active record of the pending event request.
  # requested_event - active record of the requested event relation.
  # the method then saves the 2 records in the event invitation table.
  # it then redirects to the action and controller that invoked this action.
  # Time complexity: O(n).
  #Authors: Nouran Mamdouh.

  def send_friend_request
    user_id = current_user.id
    pending_friendship = EventsInvitation.new( :invited_id => params[:inviter_id].to_i,
      :child_2_id => user_id, :status => "pending")
    requested_friendship = EventsInvitation.new( :invited_id => user_id, 
      :child_2_id => params[:inviter_id].to_i, :status => "requested")
    if eventinvitation1.save && eventinvitation2.save
      flash[:notice] = "Event request sent"
   else
      flash[:error] = "unable to send event request"
   end
    redirect_to( :controller => params[:cont].to_s, :action => params[:act].to_s)
  end
end
