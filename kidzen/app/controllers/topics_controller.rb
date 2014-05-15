class TopicsController < ApplicationController
  def index
    @topics=Topic.all
  end

  def show
    @activities=Topic.find(params[:id]).activities 
      & Activity.available(current_user.age)
  end
end
