class FriendshipsController < ApplicationController

  # This method to provide the child with a list of pending friends.
  # child - an object of the child currently signed in.
  # @pending_friends - active record of children.
  # Returns @pending_friends which is the active record of the child's pending friends.
  # Time complexity: O(n).
  #Authors: Khaled I. Elhossiny.

  def view_pending_friendship_requests
    child = Child.where("registered_user_id=#{current_user.id}").first
    @pending_friends = child.pending_friends
  end

  # This method to provide the child with the decision to either accept or reject pending friendship requests.
  # is_accepted - integer represents accepting or rejection of the pending friendship request.
  # pending_friendship - active record of the pending friendship relation that is accepted.
  # requested_friendship - active record of the requested friendship relation that is accepted.
  # destroyed_friendship - active record of the pending friendship relation that is rejected.
  # redirects to the pending friendship requests view after either accepting or rejecting a pending friendship request .
  # Time complexity: O(n).
  #Authors: Khaled I. Elhossiny.

  def accept_reject_friend_request
    is_accepted = params[:status].to_i
    if is_accepted == 1
      pending_friendship = Friendship.where("child_1_id=#{current_user.id} AND
        child_2_id=#{params[:friend_id]}").update_all(status:"accepted")
      requested_friendship = Friendship.where("child_1_id=#{params[:friend_id]} AND
        child_2_id=#{current_user.id}").update_all(status:"accepted")
      flash[:notice] = "friend request successfully accepted"
    else
      destroyed_friendship = Friendship.delete_all
        ("child_1_id=#{current_user.id} AND child_2_id=#{params[:friend_id]}")
      flash[:notice] = "friend request successfully rejected"
    end
    redirect_to( :controller => 'friendships', :action => 'view_pending_friendship_requests')
  end

  # This method to provide the child with a list of friends.
  # child - the child currently signed in.
  # @friends - active record of children.
  # Returns @friends which is the active record of the child's friends.
  # Time complexity: O(n).
  #Authors: Khaled I. Elhossiny.
 
  def view_my_friends
    child = Child.where("registered_user_id=#{current_user.id}").first
    @friends = child.friends
  end
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
    redirect_to(:back)
  end

end
