## The access page controller
##Author:- Mohamed khaled abdelmeguid

## change DB tables and attributes to be compatible with the master

class AccessPageController < ApplicationController
  #respond_to :html, :json
  def access
  	## check if the children of a parent is not empty
    if Child.find(:all).empty?
  	  puts("error")
  	end
  	  @child = Child.all
  		## here we take the values to be updated from the url but there is a bug in updating the Hash
  		#check = params[:c1]
  		#child = params[:childUpdate]
    	#@update = Permit.find_by(child_name: child).update(abilities[:can_add_mutual_friends] => check)
    #if @update.save
      #redirect_to root_url
    #else
      #flash[:notice_update_has_failed] = true
      #edirect_to root_url
    #end
  	
  	## here we take the values to be updated from the url but there is a bug in updating the DB 
  		
  	#text = params[:written]
  	#child = params[:childUpdate]
    #@upText = Permit.find_by(child_name: child).update(tags => check)
	
	##if condition to search for the tag if found we put an error else we add it to the database
	##esle if statment
    ## if Permission.find_by(current_user.username).tags()	
    #if @update.save
     #redirect_to root_url
    #else
     #flash[:notice_update_has_failed] = true
     #redirect_to root_url
    #end
  
  end


 
  end



