class FriendshipsController < ApplicationController
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
end
