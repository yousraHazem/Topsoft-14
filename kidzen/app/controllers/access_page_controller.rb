#Access Control Page
#Author:- Mohamed Khaled Abdelmeguid

class AccessPageController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:delete_tag]
  skip_before_filter :verify_authenticity_token, only: [:update]
  skip_before_filter :verify_authenticity_token, only: [:add]
  skip_before_filter :verify_authenticity_token, only: [:update_join_rooms]
  skip_before_filter :verify_authenticity_token, only: [:update_create_rooms]
  
  #This action is used to show the prevented Tags
  #Author:- Mohamed Khaled Abdelmeguid
  def access
  #if signed_in?
  @banned = Keyword.new(params[:tag])
  @child = Child.first
  #else
  #	redirect_to session_path :new
  #end
  end
  #This action deletes the prevented tags from the tags list
  #Author:- Mohamed Khaled Abdelmeguid
  def delete_tag
  @permit = params[:tag]
  @name = params[:child]
  Keyword.where(child_name: @name, tag: @permit).each do |des|
  des.destroy
  end	
  respond_to do |format|
  format.json { render json: {status: "ok"} }
  end
  end
  #This action updates a child's options available upon the decision of the parent
  #Author:- Mohamed Khaled Abdelmeguid
  def update_join_rooms
  @value = params[:value]
  @child = params[:child]
  #new_hash = {'mutual_friends_rooms_only' => @value}
  if @value == true
    @upd = Permission.find_by(registered_user_id: 2, abilities: ['can_join_public_chat_rooms' => false])
    if !@upd.nil?
      @upd.update(:abilities => {'can_join_public_chat_rooms' => true})
      @upd.save 
    else
      puts("error, No record with such option")
    end  
  end
  if @value == false
    @upd = Permission.find_by(registered_user_id: 2, abilities: ['can_join_public_chat_rooms' => true])
    if !@upd.nil?
      @upd.update(:abilities => {'can_join_public_chat_rooms' => false})
      @upd.save 
    else
      puts("error, No record with such option")
    end
  end  
  respond_to do |format|
  format.json { render json: {status: "ok"} }
  end
  end
end  

