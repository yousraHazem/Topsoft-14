class Photo < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	# has_many :comments,:tags    <<< to be un-commented once these models are created
	# belongs_to :post    <<< to be un-commented once these models are created        
	validates_presence_of :description
	validate :local_or_remote   

	def photo_params
		params.require(:photo).permit(:description, :image, :remote_image_url)
	end

	def get_id
		self[:id]
	end

	def get_description
		self[:description]
	end

	def get_comments
		# self.comments    <<< to be un-commented once these models are created
	end

	def get_tags
		# self.tags    <<< to be un-commented once these models are created
	end

	def write_comment(comment)
	end

	def tag_someone(registered_user)
	end

	def edit_description(description)
		self[:description] = description
	end
	private
	def local_or_remote
		if !(image.blank? ^ remote_image_url.blank?)
			errors.add(:base, "Please Add photo")
		end
	end
end

