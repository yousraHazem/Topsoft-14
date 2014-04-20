class FriendshipController < ApplicationController

 def index

 end
 
 def view_my_friends
 
 end

 def view_pending_friendship_requests

 end
 
 def send_friend_request
 @user_id  =  current_user.id
 @friendship1  =  Friendship.new(:child1_id => params[:friend_id].to_i, :child2_id => @user_id, :status => "pending")
 @friendship2  =  Friendship.new(:child1_id => @user_id, :child2_id => params[:friend_id].to_i, :status => "requested")
 if @friendship1.save && @friendship2.save
 flash[:notice]  =  "friend request sent"
 else 
 flash[:error]  =  "unable to send friend request"
 end
 end

 def accept_reject_friend_request

 end

end
