class VideosController < ApplicationController

  # This method is used to Allow accessing model attributes As Rails 4 does
  # not support "attr_accessible" keyword
  # Parameters : None
  # Returns : None
  # Approach : The method is  just making The model's column accessible
  # Time Complexity : O(1)
  # Author : Hussien M. Eloy
  def video_params
    params.require(:video).permit(:description, :category, :file, :real_file, :youtube)
  end

  # This method used to assign all the video in the database 
  # to variable @videos in order to view them in the index page
  # Parameters : None
  # Returns : None
  # Approach : Just returning all the records in videos table
  # Time Complexity : O(n)
  # Author : Hussien M. Eloy
  def index
    @videos = Video.all
  end

  # This method used to initialize new video and assign it to variable
  # @video in order to access it in new view
  # Parameters : None
  # Returns : None
  # Approach : Just creates new Instance of video
  # Time Complexity : O(1)
  # Author : Hussien M. Eloy
  def new
    @video = Video.new
  end

  # This method used to assign video using it's id to variable @video in order to view it
  # Parameters : None
  # Returns : None
  # Approach : Select video record using it's id
  # Time Complexity : O(log n)
  # Author : Hussien M. Eloy
  def show
    @video = Video.find(params[:id])
  end

  # This method used to initialize new video using its parameters 
  # and assign it to variable @video and trying to save it
  # and if the video was local it will try to convert the video 
  # in order to access it in form view to create
  # Parameters : None
  # Returns : None
  # Approach : Just creates new Instance of video and save and convert it
  # Time Complexity : O(1)
  # Author : Hussien M. Eloy
  def create
    @video = Video.new(video_params)
    if @video.save
      if !@video.file.blank?
        @video.convert
      end
      flash[:notice] = "Successfully created video"
      redirect_to @video
    else
      render :action => 'new'
    end
  end

  # This method used to assign video using it's id to variable @video in order to use it
  # in edit action in form view
  # Parameters : None
  # Returns : None
  # Approach : Select video record using it's id
  # Time Complexity : O(log n)
  # Author : Hussien M. Eloy
  def edit
    @video = Video.find(params[:id])
  end

  # This method used to assign video using it's id to variable @video in order to use it
  # in update action in form view
  # Parameters : None
  # Returns : None
  # Approach : Select video record using it's id
  # Time Complexity : O(log n)
  # Author : Hussien M. Eloy
  def update
   @video = Video.find(params[:id])
    if @video.update_attributes(video_params)
      flash[:notice] = "Successfully updated video"
      redirect_to video_url
    else
    render :action => 'edit' 
    end
  end

  # This method used to assign video using it's id to variable @video in order to use it
  # in destroy action in form view
  # Parameters : None
  # Returns : None
  # Approach : Select video record using it's id
  # Time Complexity : O(log n)
  # Author : Hussien M. Eloy
  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    flash[:notice] = "Successfully destroyed video"
    redirect_to videos_url
  end
end
