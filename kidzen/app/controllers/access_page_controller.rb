#Access Control Page
#Authors:- Mohamed Khaled Abdelmeguid
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
  #redirect_to session_path :new
  #end
  end
  #This action deletes the prevented tags from the tags list
  #Author:- Mohamed Khaled Abdelmeguid
  def update_create_rooms
  @value = params[:value]
  @child = params[:child]
  if @value == true
    @upd = Permission.find_by(registered_user_id: 2, abilities: ['can_create_public_chat_rooms' => false])
    if !@upd.nil?
      @upd.update(:abilities => {'can_create_public_chat_rooms' => true})
      @upd.save 
    else
      puts("error, No record with such option")
    end  
  end
  if @value == false
    @upd = Permission.find_by(registered_user_id: 2, abilities: ['can_create_public_chat_rooms' => true])
    if !@upd.nil?
      @upd.update(:abilities => {'can_create_public_chat_rooms' => false})
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
