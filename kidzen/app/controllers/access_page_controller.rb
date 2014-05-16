# Access Control Page.
# Authors: Mohamed Khaled Abdelmeguid.

class AccessPageController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:delete_tag]
  skip_before_filter :verify_authenticity_token, only: [:update_mutual_rooms]
  skip_before_filter :verify_authenticity_token, only: [:add]
  
  #This action is used to show the prevented Tags.
  #Authors:- Mohamed Khaled Abdelmeguid.
  #Child.first will be replaced by params [dependency waiting].
  def access
  if signed_in?
    @child = Child.find_by(registered_user_id: params[:id])
  else
    redirect_to session_path :new
  end
  end
  # This action changes an option value of a child in the DB
  # according to his parent choice.
  # Authors: Mohamed Khaled AbdelMeguid.
  def update_mutual_rooms
  @value = params[:value]
  @child = params[:child]
  if @value == true
    @upd = Permission.find_by(registered_user_id: @child,
      abilities: ['mutual_friends_rooms_only' => false])
    if !@upd.nil?
      @upd.update(:abilities => {'mutual_friends_rooms_only' => true})
      @upd.save 
    else
      puts("error, No record with such option")
    end  
  end
  if @value == false
    @upd = Permission.find_by(registered_user_id: @child, 
      abilities: ['mutual_friends_rooms_only' => true])
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

