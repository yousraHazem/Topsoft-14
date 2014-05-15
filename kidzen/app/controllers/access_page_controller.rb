#Access Control Page
#Author:- Mohamed Khaled Abdelmeguid

class AccessPageController < ApplicationController
	skip_before_filter :verify_authenticity_token, only: [:delete_tag]
  skip_before_filter :verify_authenticity_token, only: [:add]
  skip_before_filter  :verify_authenticity_token

  #This action is used to show the prevented Tags
  #Author:- Mohamed Khaled Abdelmeguid
  #Child.first will be replaced by params [dependency waiting]
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

  def delete_topic
    @topic = params[:topic]
    @child = params[:child]
    BannedTopic.where(child_name: @child, activity_topic: @topic).each do |des|
      des.destroy
    end 
    respond_to do |format|
      format.json { render json: {status: "ok"} }
    end
  end

  def ban_topic
    @topic = params[:topic]
    @child = params[:child]
    puts("hjfg")
    if !BannedTopic.exists?(child_name: @child, activity_topic: @topic)
      BannedTopic.create(:child_name => @child, :activity_topic => @topic)
    end
    respond_to do |format|
      format.json { render json: {status: "ok"} }
    end
  end
end  

