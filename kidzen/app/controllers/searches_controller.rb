#This class is controller class used in searching.
#Authors: Moaz El-Nashar.
class SearchesController < ApplicationController

# This is a function which take a parameter ":search" and search with it in each table
# Returns all found results in each table.
# Time complexity: 4*O(n).
#Authors: Moaz El-Nashar.	
	def index
		if params[:search].present?
			@registered_users = RegisteredUser.search params[:search]
			@events = Event.search params[:search]
			@groups = Group.search params[:search]
			@activities = Activity.search params[:search]
		end
	end	
end
