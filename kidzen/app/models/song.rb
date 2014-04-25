# This model is used to create and manipulate songs 
# It 's empty right  now but will be modified later
# Attributes : name string
#              artist string
#              album string
#              length integer
# Relations : It belongs to a playlist
# Author : Hussien M. Eloy
class Song < ActiveRecord::Base
	belongs_to :playlist
	validates :length, :numericality => {:only_integer => true}

 
 # This function is used to initialize attributes of the model 
 # as Rails 4 prevent listing accessible fields in model
 # so it depends on Something called strong parameters to protect Accessibility
 # Author : Hussien M. Eloy
  def song_params
    params.require(:song).permit(:name,:artist,:album,:length)
  end

  
  # This function is used to play the current song
  #Author : Hussien M. Eloy
  def play
  end

  
  # This function is used to pause the current song
  #Author : Hussien M. Eloy
  def pause
  end

  
  # This function is used to stop the current song
  #Author : Hussien M. Eloy
  def stop
  end


  # This function is used to rewind the current song
  #Author : Hussien M. Eloy
  def rewind
  end


  # This function is used to forward the current song
  #Author : Hussien M. Eloy
  def forward
  end


  # This function is used to loop on the current song
  #Author : Hussien M. Eloy
  def loop
  end


end
