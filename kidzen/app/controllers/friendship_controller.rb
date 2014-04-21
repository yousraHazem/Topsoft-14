class FriendshipController < ApplicationController

 def index

 end
  
 def view_my_friends

 end
 
 # This method to provide the child with a list of pending friends.
 # child - an object of the child currently signed in.
 # @pending_friends - active record of children.
 # Returns @pending_friends which is the active record of the child's pending friends.
 # Time complexity: O(n).
 #Authors: Khaled I. Elhossiny.

 def view_pending_friendship_requests
 child=Child.where("registered_user_id=#{current_user.id}").first
 @pending_friends=child.pending_friends
 end
 
 def send_friend_request

 end
 
 # This method to provide the child with the decision to either accept or reject pending friendship requests.
 # is_accepted - integer represents accepting or rejection of the pending friendship request.
 # rec1 - active record of the pending friendship relation that is accepted.
 # rec2 - active record of the requested friendship relation that is accepted.
 # destroyed_friendship - active record of the pending friendship relation that is rejected.
 # redirects to the pending friendship requests view after either accepting or rejecting a pending friendship request .
 # Time complexity: O(n).
 #Authors: Khaled I. Elhossiny.

 def accept_reject_friend_request
 is_accepted = params[:status].to_i
 if is_accepted == 1
 rec1 = Friendship.where("child1_id=#{current_user.id} AND child2_id=#{params[:friend_id]}").update_all(status:"accepted")
 rec2 = Friendship.where("child1_id=#{params[:friend_id]} AND child2_id=#{current_user.id}").update_all(status:"accepted")
 flash[:notice]="friend request successfully accepted"
 else
 destroyed_friendship=Friendship.delete_all("child1_id=#{current_user.id} AND child2_id=#{params[:friend_id]}")
 flash[:notice]="friend request successfully rejected"
 end
 redirect_to(:controller => 'friendship',:action => 'view_pending_friendship_requests')
 end

end
