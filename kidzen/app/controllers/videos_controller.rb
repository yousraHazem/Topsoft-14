class VideosController < ApplicationController
  def video_params
  params.require(:video).permit(:description, :length, :category, :file)
  end

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def show
    @video = Video.find(params[:id])
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      flash[:notice] = "Successfully created video"
      redirect_to @video
    else
      render :action => 'new'
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(video_params)
      flash[:notice] = "Successfully updated video"
      redirect_to video_url
    else
    render :action => 'edit' 
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    flash[:notice] = "Successfully destroyed video"
    redirect_to videos_url
  end
end
