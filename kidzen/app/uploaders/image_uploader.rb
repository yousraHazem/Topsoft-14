# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file

  # This method is used to store the uploaded photo to specified
  # location in the server.
  # Parametes : None.
  # Returns : photo's url - string.
  # Approch : Just assigning the stored directory to the returned url.
  # Author : Hussien M. Eloy.  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  # This method is used to set image dimensions.
  # Parametes : None.
  # Returns : None.
  # Approch : Assign the photo to be resized according to give layout and size.
  # Author : Hussien M. Eloy.  
  version :thumb do
    process :resize_to_fit => [500, 500]
  end
  
  # This method is used to specify the valid extensions of uploaded files.
  # Parametes : None.
  # Returns : None.
  # Approch : Just saying that the suffix of the uploaded file 
  # should be of these extensions.
  # Author : Hussien M. Eloy.  
  def extension_white_list
    %w(jpg jpeg gif png)
  end

 
end
