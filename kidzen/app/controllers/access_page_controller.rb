#Access Control Page
#Author:- Mohamed Khaled Abdelmeguid

class AccessPageController < ApplicationController
	skip_before_filter :verify_authenticity_token, only: [:delete_tag]
  skip_before_filter :verify_authenticity_token, only: [:update]
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
  #This action updates a child's options available upon the decision of the parent
  #Author:- Mohamed Khaled Abdelmeguid
  def update
  @value = params[:valueUpdate]
  @child = params[:child]
  @ability = params[:abilityUpdate]
  #new_hash = {'mutual_friends_rooms_only' => @value}
  if @value == true
    @upd = Permission.find_by(registered_user_id: 2, abilities: ['mutual_friends_rooms_only' => false])
    if !@upd.nil?
      @upd.update(:abilities => {'mutual_friends_rooms_only' => true})
      @upd.save 
    else
      puts("error, No record with such option")
    end  
  end
  if @value == false
    @upd = Permission.find_by(registered_user_id: 2, abilities: ['mutual_friends_rooms_only' => true])
    if !@upd.nil?
      @upd.update(:abilities => {'mutual_friends_rooms_only' => false})
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

