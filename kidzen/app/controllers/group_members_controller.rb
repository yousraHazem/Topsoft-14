class GroupMembersController < ApplicationController
  def index
    @group_members = GroupMember.where(:group_id => params[:id])
  end
  # This piece of code allows a user to view the members of a group
  # The members are populated in @group_members to allow the model to generate a list of members
  # Returns nothing
  # Time Complexity: O(n).
  # Author: Mohamed Bahgat Elrakaiby
  def view
      @group_members = GroupMember.where(:group_id => params[:id])
  end

  def group_member_params
      params.require(:group_members).permit(:group_id, :username)
  end

end
