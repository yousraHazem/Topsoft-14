class TopicsController < ApplicationController
  
  # Shows all topics 
  # Authors: Khaled I. Elhossiny
  def index
    @topics=Topic.all
  end
  
  # Shows all activities that are available for the logged in child 
  # Authors: Khaled I. Elhossiny
  def show
    @activities=Topic.find(params[:id]).activities 
      & Activity.available(current_user.age)
  end
end
