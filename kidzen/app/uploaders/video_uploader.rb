# encoding: utf-8

class VideoUploader < CarrierWave::Uploader::Base

  # This method is used to store the uploaded video to specified
  # location in the server.
  # Parametes : None.
  # Returns : video's url - string.
  # Approch : Just assigning the stored directory to the returned url.
  # Author : Hussien M. Eloy.  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # This method is used to specify the valid extensions of uploaded files.
  # Parametes : None.
  # Returns : None.
  # Approch : Just saying that the suffix of the uploaded file 
  # should be of these extensions.
  # Author : Hussien M. Eloy. 
  def extension_white_list
    %w(mov avi mp4 mkv wmv mpg flv)
  end

end
