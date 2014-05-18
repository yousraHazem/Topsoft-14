
#Access Control Page
#Author:- Mohamed Khaled Abdelmeguid
class AccessPageController < ApplicationController
	skip_before_filter :verify_authenticity_token, only: [:delete_tag]
  skip_before_filter :verify_authenticity_token, only: [:add]
  skip_before_filter  :verify_authenticity_token
  skip_before_filter :verify_authenticity_token, only: [:update_mutual_rooms]
  skip_before_filter :verify_authenticity_token, only: [:update]
  skip_before_filter :verify_authenticity_token, only: [:update_join_rooms]
  skip_before_filter :verify_authenticity_token, only: [:update_create_rooms]
  

  
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

  #This action is used to add a new prevented tag by submitting it
  #and we first check if it's already found in the DB
  #Author:- Mohamed Khaled AbdelMeguid
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

  # This action is used to unban a topic to specific child.
  # topic - topic that should be unbanned.
  # child - the specific child username.
  # Authors:- Shary Beshara.
  def delete_topic
    @topic = params[:topic]
    @child = params[:child]
    BannedTopic.where(child_name: @child, activity_topic: @topic).each do 
      |topic|
      topic.destroy
    end 
    respond_to do |format|
      format.json { render json: {status: "ok"} }
    end
  end

  # This action is used to ban a topic to specific child.
  # topic - topic that should be banned.
  # child - the specific child username.
  # Authors:- Shary Beshara.
  def ban_topic
    @topic = params[:topic]
    @child = params[:child]
    if !BannedTopic.exists?(child_name: @child, activity_topic: @topic)
      BannedTopic.create(:child_name => @child, :activity_topic => @topic)
    end
    respond_to do |format|
      format.json { render json: {status: "ok"} }
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

end 
