class GroupMembersController < ApplicationController
    def index
    end

    # This is a function that allows a user to leave a group
    # Returns nothing
    # Time complexity: O(1).
    # Author: Mohamed Bahgat Elrakaiby
    def leave_group
      m = GroupMember.where(:username => current_user.username , :group_id => :group_id)
      m.destroy
      @g = Group.where(:group_id => :group_id)
      redirect_to @g
    end

end 
