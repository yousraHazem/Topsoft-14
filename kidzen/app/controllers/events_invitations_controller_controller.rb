class EventsInvitationsControllerController < ApplicationController

	 def index

  end
  
  def view_my_friends

  end
 
 # This method to provide the child with a list of pending events.
 # child - an object of the child currently signed in.
 # @pending_events - active record of children.
 # Returns @pending_events which is the active record of the child's pending events.
 # Time complexity: O(n).
 # Authors: Nouran Mamdouh.

  def view_pending_event_requests
    child = Child.where("registered_user_id=#{current_user.id}").first
    @pending_events = child.pending_events
  end

 
  def send_event_request

  end
end
 # This method to provide the child with a list of pending events.
  # child - an object of the child currently signed in.
  # @pending_events - active record of children.
  # Returns @pending_events which is the active record of the child's pending events.
  # Time complexity: O(n).
  # Authors: Nouran Mamdouh.

    def view_accepted_event_requests
    child = Child.where("registered_user_id=#{current_user.id}").first
    @accepted_events = child.accepted_events
  end

  # This method to provide the child with a list of pending events.
  # child - an object of the child currently signed in.
  # @pending_events - active record of children.
  # Returns @pending_events which is the active record of the child's pending events.
  # Time complexity: O(n).
  #Authors: Nouran Mamdouh.

    def view_rejected_event_requests
    child = Child.where("registered_user_id=#{current_user.id}").first
    @rejected_events = child.rejected_events
  end
end
