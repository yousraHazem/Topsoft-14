class Video < ActiveRecord::Base
	# has_many :comments, :tags, :keywords
	# belongs_to :post
	def video_params
	params.require(:video).permit(:description, :length, :category)
	end

	def get_id
		self[:id]
	end

	def get_description
		self[:description]
	end

	def get_length
		self[:length]
	end

	def get_category
		self[:category]
	end

	def edit_description(description)
		self[:description] = description
	end

	def edit_category(category)
		self[:category] = category
	end

	def get_comments
	#	self.comments
	end

	def write_comment(comment)
	end

	def get_tags
	#	self.tags
	end

	def get_related_videos
	end

	def get_keywords
	#	self.keywords
	end

	def add_keyword(keyword)
	end
end
