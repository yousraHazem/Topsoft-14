class GroupsController < ApplicationController
# Method for creating a new group
# username-string
# group_name-string
# Insertion of a new record in table groups
# The function takes a unique username, and a group_name and creates a new group by creating and inserting a new record in table groups
# Author: Nouran T. Attia

    def create_group
        t = Group.new
        t.creator = params[:username]
        t.group_name = params[:group_name]
        t.save
    end

# Method for setting the privacy of the group
# privacy-string
# updating value in a table (table groups)
# The function is responsible for setting /updating the privacy attribute of the group, by setting the value of column privacy in groups table with the value inserted to it
# Author: Nouran T. Attia

# how can I get the id of the group from the autoincrement?
    def set_privacy
        t = Group.find(params[:id])
        t.privacy = params[:privacy]
        t.save
    end

end
