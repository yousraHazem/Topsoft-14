# This class is controller class used in storing images in the database 
# And in folder ("public/photos/upload_photo") and view the image afterwards
# Author : Hussien M. Eloy
class PublicController < ApplicationController
	

# This function is used to list all the images that are present in the database 
# and initialize a new photo
# Author : Hussien M. Eloy
  def upload_photo 
	@photos = Photo.all
	@photo = Photo.new	
	end



  # This function is used to initialize a photo object from the photo model 
  # Then it would check if the image is of valid extension then assign it to the folder
  # that keeps the photos and then open it, if the image is not of a valid extension
  # it would print warning statement
  # Author : Hussien M. Eloy
	def uploading
		@photo = Photo.new
		file_type = params[:photo][:uploaded_photo].content_type unless  params[:photo].nil?
		 if file_type == 'photo/jpeg' || file_type == 'photo/jpg' || 
		 	file_type == 'photo/png' || file_type == 'photo/gif' || file_type == 'photo/bmp'
      case file_type
         when "photo/jpeg"
            file_name = "pic_#{Time.now.strftime("%Y%m%d%H%M%S")}.jpg"
         when "photo/png"
            file_name = "pic_#{Time.now.strftime("%Y%m%d%H%M%S")}.png"
         when "photo/gif"
            file_name = "pic_#{Time.now.strftime("%Y%m%d%H%M%S")}.gif"
         when "photo/bmp"
            file_name = "pic_#{Time.now.strftime("%Y%m%d%H%M%S")}.bmp"
      end
      file_path = File.join(Rails.root,'public','photos','upload_photo',file_name)
      File.open(file_path,'wb') do |f|
      	f.write params[:photo][:uploaded_photo].read
      end
      @photo.photo_name = file_name
      @photo.photo_type = file_type
      @photo.save
      redirect_to uploadphoto_path
  else
  	@photos = Photo.all
  	@photo.errors.add(:photo,"should be in correct format")
  	render 'upload_photo'
	end
end



# This function is used to remove a photo from the database and from the view page
# Author : Hussien M. Eloy
def remove_photo
	@photo = Photo.find(params[:id])
	img_path = File.join(Rails.root,'publc','photos','upload_photo',photo.photo_name)
	File.delete(img_path)
	image.destroy
	redirect_to uploadphoto_path
	end


end
