class FriendshipsController < ApplicationController
  # This method to send a friendship request.
  # user_id - the id of the child currently signed in.
  # pending_friendship - active record of the pending friendship relation.
  # requested_friendship - active record of the requested friendship relation.
  # the method then saves the 2 records in the friendship table.
  # it then redirects to the action and controller that invoked this action.
  # Time complexity: O(n).
  #Authors: Khaled I. Elhossiny.

  def send_friend_request
    user_id = current_user.id
    pending_friendship = Friendship.new( :child_1_id => params[:friend_id].to_i,
    :child_2_id => user_id, :status => "pending")
    requested_friendship = Friendship.new( :child_1_id => user_id, 
    :child_2_id => params[:friend_id].to_i, :status => "requested")
    if friendship1.save && friendship2.save
      flash[:notice] = "friend request sent"
   else
      flash[:error] = "unable to send friend request"
   end
    redirect_to( :controller => params[:cont].to_s, :action => params[:act].to_s)
  end
end
