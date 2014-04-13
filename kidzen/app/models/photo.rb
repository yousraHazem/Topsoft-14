class Photo < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	def photo_params
		params.require(:photo).permit(:description, :image, :remote_image_url)
	end

	def get_id
		self[:id]
	end

	def get_description
		self[:description]
	end

	def edit_description(description)
		self[:description] = description
	end
end

