class FriendshipController < ApplicationController

 def index
 end
 
 def view_my_friends
 @friends = current_user.friends
 end

 def view_pending_friendship_requests
 end
 
 def send_friend_request
 end

 def accept_reject_friend_request
 end

end
