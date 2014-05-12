class Puzzle < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	validates_presence_of :description, :image 



	def photo_params
	    params.require(:photo).permit(:description, :image, :remote_image_url)
	end


	def get_id
	    self[:id]
	end
end
