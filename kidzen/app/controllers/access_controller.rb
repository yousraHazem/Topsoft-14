class AccessController < ApplicationController
 def access
 @banned = Permission.new(params[:name])
 @banned_items = Permission.find(:all) 
 @banned_delete = Permission.find_by name: @banned_delete
   end

 def add
 ban = Permission.create(:name => params[:name])
 redirect_to :action => 'access'
 end

 def delete
 @banned_delete.delete
 redirect_to access_access_path
 end
end
