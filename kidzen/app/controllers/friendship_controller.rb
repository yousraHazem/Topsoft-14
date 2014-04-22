class FriendshipController < ApplicationController

 def index

 end
 
 def view_my_friends
 
 end

 def view_pending_friendship_requests

 end

 # This method to send a friendship request.
 # user_id - the id of the child currently signed in.
 # friendship1 - active record of the pending friendship relation.
 # friendship2 - active record of the requested friendship relation.
 # the method then saves the 2 records in the friendship table.
 # it then redirects to the action and controller that invoked this action.
 # Time complexity: O(n).
 #Authors: Khaled I. Elhossiny.

 def send_friend_request
 user_id  =  current_user.id
 friendship1  =  Friendship.new(:child1_id => params[:friend_id].to_i, :child2_id => user_id, :status => "pending")
 friendship2  =  Friendship.new(:child1_id => user_id, :child2_id => params[:friend_id].to_i, :status => "requested")
 if friendship1.save && friendship2.save
 flash[:notice]  =  "friend request sent"
 else 
 flash[:error]  =  "unable to send friend request"
 end
 redirect_to(:controller => params[:cont].to_s,:action => params[:act].to_s)
 end

 def accept_reject_friend_request

 end

end
