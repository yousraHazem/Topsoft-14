class ProfilesController < ApplicationController
 def supervisor
 @super = Supervisor.first
 #.first has to be changed using signIn/Login
 @parent = ParentChild.find_by parent_name: @super.name
 if (@parent.parent_name == @super.name && @parent.child_name != nil)
   redirect_to access_access_path
 end
end
