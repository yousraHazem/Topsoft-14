class GroupMembersController < ApplicationController
    

    
    # This piece of code allows a user to view the members of a group
    # The members are populated in @group_members to allow the model to generate a list of members
    # Returns nothing
    # Time Complexity: O(n).
    # Author: Mohamed Bahgat Elrakaiby
    def index
      @group_members = GroupMember.all
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
