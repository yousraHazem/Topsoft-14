class GroupMembersController < ApplicationController
	layout false

	def index
		@group_members = GroupMember.all
	end

	# This is a function that adds a member to the group by his name.
	# user is a variable of type RegisteredUser
	# child is a variable of type Child
	# m is a variavle of type GroupMember
    # Time complexity: O(1).
    # Authors: Mohammed T. Nabih.
    def add_member_name
    	user = RegisteredUser.all.where(:first_name => :first_name)
   		child = Child.where(:registered_user_id => user.id)
    	m = GroupMember.where(:username => user.username , :group_id => :group_id)
    	m.member_accept_state = 2
    	m.save
    end
    

    # This is a function that adds a member to the group by his email.
    # Doesn't return anything.
    # Time complexity: O(n).
    # Authors: Mohammed T. Nabih.
    def add_member_email
   		user = RegisteredUser.all.where(:email => :email)
   		child = Child.where(:registered_user_id => user.id)
    	m = GroupMember.where(:username => user.username , :group_id => :group_id)
    	m.member_accept_state = 2
    	m.save

    end

    # This is a function that adds a member to the group by his phone number.
    # Doesn't return anything.
    # Time complexity: O(n).
    # Authors: Mohammed T. Nabih.
    def add_member_phone
    	user = RegisteredUser.all.where(:phone => :phone)
   		child = Child.where(:registered_user_id => user.id)
    	m = GroupMember.where(:username => user.username , :group_id => :group_id)
    	m.member_accept_state = 2
    	m.save
    end
	
end
