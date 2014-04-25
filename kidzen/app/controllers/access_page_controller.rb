# The access page controller
#Author:- Mohamed Khaled Abdelmeguid

# change DB tables and attributes to be compatible with the master (DONE)

class AccessPageController < ApplicationController
  def access
    # check if the children of a parent is not empty
    if RegisteredUser.find_by(id: ChildParent.find_by(parent_id: current_user.id).child_id).nil?
    &&ChildParent.find_by(parent_id: current_user.id).nil?
    && ChildParent.find_by(parent_id: current_user.id).child_id.nil?
    &&Supervisor.find_by(supervisor_id: current_user.id).nil?
      puts("error there is no child")
    else
      @child = ChildParent.find_all_by_parent_id (current_user.id)
    end

  	# here we take the values to be updated from the url but there is a bug in updating the Hash
    check = params[:c1]
    child = params[:childUpdate]
    @update = Permission.find_by(child_name: child).update(abilities[:can_add_mutual_friends] => check)
    if @update.save
      redirect_to root_url
    else
      flash[:notice_update_has_failed] = true
      edirect_to root_url
    end
  	
  	# here we take the values to be updated from the url but there is a bug in updating the DB 
  		
  	text = params[:written]
  	child = params[:childUserName]
    if Permission.find_by(registered_user_id: RegisteredUser.find_by(username: child).id).tags == text
      puts("this tag is already submitted, please enter a new tag that is not found in the list")
    end
    @upText = Permission.find_by(registered_user_id: RegisteredUser.find_by(username: child).id).update(tags => text)

    if @update.save
      redirect_to root_url
    else
      flash[:notice_update_has_failed] = true
      redirect_to root_url
    end
  
    end
  end
  




