class FriendshipController < ApplicationController
 def index
 end
 
 def find_friends
 end
 
 def view_my_friends
 end

 def view_pending_friendship_requests
 @pending_friends=current_user.pending_friends
 end
 
 def send_friend_request
 end

 def accept_reject_friend_request
 if params[:status].to_i == 1
 Friendship.where("friend_id=#{current_user.id} AND user_id=#{params[:friend_id]}").update_all(status: "accepted")
 Friendship.where("friend_id=#{params[:friend_id]} AND user_id=#{current_user.id}").update_all(status: "accepted")
 flash[:notice] = "friend request successfully accepted"
 else
 @destroyed_friendship=Friendship.delete_all("friend_id=#{current_user.id} AND user_id=#{params[:friend_id]}")
 flash[:notice] = "friend request successfully rejected"
 end
 redirect_to(:controller => 'friendship', :action => 'view_pending_friendship_requests')
 end
end
