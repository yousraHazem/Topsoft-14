class GroupMembersController < ApplicationController

# Method for accepting a join request into the group specified
# username-string
# group_id-integer
# updating an existing record in table group_members
# The function takes a unique username, and a group_id and  updates an existing group_member record by setting the value of column invite to 1 indicating accepting the join request
# Author: Nouran T. Attia

    def accept_member
        t = GroupMember.where(:group_id => params[:group_id], :username => params[:username])
        t.invite = 1
        t.save
    end

# Method for viewing the join requests sent to the group
# group_id-integer
# the method returns a container of the member requests to the group containg the username, and the id of the group to join
# The function takes a group_id, and 
# Author: Nouran T. Attia

    def view_member_request
        t = GroupMember.where(:group_id => params[:group_id], :accept => 2)
    end
end
