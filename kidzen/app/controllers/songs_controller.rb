class SongsController < ApplicationController
  

  # This method used to assign all the songs in the database.
  # to variable @songss in order to view them in the index page.
  # Parameters : None.
  # Returns : None.
  # Approach : Just returning all the records in songs table.
  # Author : Hussien M. Eloy.
  def index
    @songs = Song.all
  end
  
  # This method used to assign song using it's id
  # to variable @song in order to view it.
  # Parameters : None.
  # Returns : None.
  # Approach : Select song record using it's id.
  # Author : Hussien M. Eloy. 
  def show
    @song = Song.find(params[:id])
  end

  # This method used to initialize new song and assign it to variable
  # @song in order to access it in new view.
  # Parameters : None.
  # Returns : None.
  # Approach : Just creates new Instance of song.
  # Author : Hussien M. Eloy.
  def new
    @song = Song.new
  end

  # This method used to assign song using it's id
  # to variable @song in order to use it
  # in edit action in form view.
  # Parameters : None.
  # Returns : None.
  # Approach : Select song record using it's id.
  # Author : Hussien M. Eloy.
  def edit
    @song = Song.find(params[:id])
  end

  # This method used to initialize new song using its parameters
  # and assign it to variable @song and trying to save it
  # and convert the song in order to access it in form view to create.
  # Parameters : None.
  # Returns : None.
  # Approach : Just creates new Instance of song and save and convert it.
  # Author : Hussien M. Eloy.
  def create
    @song = Song.new(song_params)
    if @song.save
      @song.convert
      flash[:notice] = "Successfully created song"
      redirect_to @song
    else
      render :action => 'new'
    end
  end

  # This method used to assign song using it's id
  # to variable @song in order to use it
  # in destroy action in form view.
  # Parameters : None.
  # Returns : None.
  # Approach : Select song record using it's id.
  # Author : Hussien M. Eloy.
  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Successfully destroyed Song"
    redirect_to videos_url
  end
  
  # This method is used to Allow accessing model attributes As Rails 4 does
  # not support "attr_accessible" keyword.
  # Parameters : None.
  # Returns : None.
  # Approach : The method is just making The model's column accessible.
  # Author : Hussien M. Eloy.
  def song_params
    params.require(:song).permit(:name, :file, :real_file)
  end

end
