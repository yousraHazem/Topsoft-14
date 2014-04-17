class FriendshipController < ApplicationController
 def index
 end
 
 def find_friends
 end
 
 def view_my_friends
 @friends = current_user.friends
 end

 def view_pending_friendship_requests
 end
 
 def send_friend_request
 @user_id  =  current_user.id
 @friendship1  =  Friendship.new(:user_id => params[:friend_id].to_i, :friend_id => @user_id, :status => "pending")
 @friendship2=Friendship.new(:user_id => @user_id, :friend_id => params[:friend_id].to_i, :status => "requested")
 if @friendship1.save && @friendship2.save
 flash[:notice]  =  "friend request sent"
 else flash[:error]  =  "unable to send friend request"
 end
 #render('find_friends')
 end

 def accept_reject_friend_request
 end
end
