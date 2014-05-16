# Access Control Page.
# Authors: Mohamed Khaled Abdelmeguid.

class AccessPageController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:delete_tag]
  skip_before_filter :verify_authenticity_token, only: [:update]
  skip_before_filter :verify_authenticity_token, only: [:add]
  
  # This action is used to show the prevented Tags.
  # Authors: Mohamed Khaled Abdelmeguid.
  #Child.first will be replaced by params [dependency waiting]
  def access
    if signed_in?
      @child = Child.find_by(registered_user_id: params[:id])
    else
      redirect_to session_path :new
    end
    end
 
  # This action deletes the prevented tags from the tags list.
  # Authors: Mohamed Khaled Abdelmeguid.
  def delete_tag
    if Supervisor.find_by(registered_user_id: current_user.id) == 
      ChildParent.find_by(parent_id: current_user.id)
      @permit = params[:tag]
      @name = params[:child]
      Keyword.where(child_name: @name, tag: @permit).each do |tag|
        tag.destroy
      end
    end	
    respond_to do |format|
      format.json { render json: {status: "ok"} }
    end
  end
  
  # This action is used to add a new prevented tag by submitting it
  # and we first check if it's already found in the DB.
  # Authors: Mohamed Khaled AbdelMeguid.
  def add
    @child = params[:child]
    @ban = params[:ban]
    if Keyword.find_by(child_name: @child, tag: @ban).nil?
      @new = Keyword.new
      @new.Child_name = @child
      @new.tag = @ban
      @new.save
    else
      puts("already exists")
    end
    respond_to do |format|
      format.json { render json: {status: "ok"} }
    end
  end
end  

