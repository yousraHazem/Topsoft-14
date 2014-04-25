class GroupMembersController < ApplicationController
    layout false

    def index
      @group_members = GroupMember.all
    end

    # This is a function that adds a member to the group by his name.
    # user is a variable of type RegisteredUser.
    # child is a variable of type Child.
    # member is a variavle of type GroupMember.
    # Time complexity: O(1).
    # Authors: Mohammed T. Nabih.
    def add_member_name
      user = RegisteredUser.all.where(:first_name => :first_name , :last_name => :last_name , :username => :username)
      child = Child.where(:registered_user_id => user.id)
      memeber = GroupMember.where(:username => user.username , :group_id => :group_id)
      member.member_accept_state = 2
      member.save
    end
    

    # This is a function that adds a member to the group by his email.
    # Doesn't return anything.
    # user is a variable of type RegisteredUser.
    # child is a variable of type Child.
    # member is a variable of type GroupMember.
    # Time complexity: O(n).
    # Authors: Mohammed T. Nabih.
    def add_member_email
      user = RegisteredUser.all.where(:email => :email)
      child = Child.where(:registered_user_id => user.id)
      member = GroupMember.where(:username => user.username , :group_id => :group_id)
      member.member_accept_state = 2
      member.save
    end

    # This is a function that adds a member to the group by his phone number.
    # Doesn't return anything.
    # user is a variable of type RegisteredUser.
    # child is a variable of type Child.
    # member is a variable of type GroupMember.
    # Time complexity: O(n).
    # Authors: Mohammed T. Nabih.
    def add_member_phone
      user = RegisteredUser.all.where(:phone => :phone)
      child = Child.where(:registered_user_id => user.id)
      member = GroupMember.where(:username => user.username , :group_id => :group_id)
      member.member_accept_state = 2
      memberd.save
    end
end
