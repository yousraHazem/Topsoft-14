# This is Video Model that is used to upload Videos into the website
# The uploading process mostly happens with usage of CarrierWave Gem
# The converting of videos is done through streamio-ffmpeg Gem
# and finally viewing the videos is through html 5 player
# unless the video is exported from the internet
# Attributes : * description - string
#              * file - string (Name of the image file on the machine)
#              * youtube - string  (The url of the youtube video )
#              * id - integer (Auto-increment key generated by the database)
#              * category - string (Category of the video "Can be enhanced afterwards")
#              * real_file - string (The real .webm file that used to play the video)
# Relations  : * Photo can have many comments and tags
#              * A photo should belong to a post
# Constrains : * A description to the photo should be present
#            : * A local video should present OR an youtube hyperLink
#            : * The video file should be of extension (mov avi mp4 mkv wmv mpg flv)
#                and this ensured in VideoUploader class using def extension_white_list 
class Video < ActiveRecord::Base
  # has_many :comments, :tags, :keywords
  # belongs_to :post
  require 'rubygems'
  require 'streamio-ffmpeg'
  mount_uploader :file, VideoUploader
  validates_presence_of :description
  validate :local_or_remote 

  # This method checks that one of the 2 fields that used in uploading
  # video is not empty
  # Parameters : None
  # Returns : None
  # Approach : The method perfoms an addition between the values
  # of the blank fields, And it should arise 
  # an error if both are true or both are false
  # Time Complexity : O(1)
  # Author : Hussien M. Eloy
  def local_or_remote
    counter = 0
    if file.blank? 
      counter = counter + 1
    end
    if youtube.blank?
      counter = counter + 1
    end
    if counter != 1
      errors.add(:base, "Please Add video")
    end
  end

  # This method is used to Allow accessing model attributes As Rails 4 does
  # not support "attr_accessible" keyword
  # Parameters : None
  # Returns : None
  # Approach : The method is  just making The model's column accessible
  # Time Complexity : O(1)
  # Author : Hussien M. Eloy 
  def video_params
    params.require(:video).permit(:description, :category, :file, :real_file, :youtube, :screenshot)
  end

  # This method is used to convert the video entered by the user
  # Parameters : None
  # Returns : None
  # Approach : The method use ffmpeg gem in order to convert the video that give by the user
  # that is suffixed by the extension mentioned above, then it would convert it to .webm extension
  # that is used in html 5 video player and updates the real_file value with the new file that is passed 
  # to 'show' view,and finally save the record to validate the changes 
  # Time Complexity : O(1)
  # Author : Hussien M. Eloy 
  def convert
    new_video = 
    FFMPEG::Movie.new("#{Rails.root}/public/uploads/video/file/#{self[:id]}/#{self[:file]}")
    new_video.transcode("#{Rails.root}/public/uploads/tmp/#{self[:id]}.webm")
    self[:real_file] = "/uploads/tmp/#{self[:id]}.webm"
    new_video.screenshot("#{Rails.root}/public/uploads/tmp/scr#{self[:id]}.jpg", :seek_time => 3)
    self[:screenshot] = "/uploads/tmp/scr#{self[:id]}.jpg"
    self.save
  end

  # This method is used to extract the code of the video
  # from the youtube link in order to embed it in show view
  # Parameters : None
  # Returns : string
  # Approach : The method splits the url from '=' sign to get
  # the code of the video
  # Time Complexity : O(1)
  # Author : Hussien M. Eloy 
  def get_link
    self.youtube.split('=').last if self.youtube
  end

  # This method returns the value of the video id
  # Parameteres : None
  # Returns : id - integer
  # Approach : Just selecting the value of the current video id from the database
  # Time Complexity : O(log n)
  # Author : Hussien M. Eloy
  def get_id
    self[:id]
  end

  # This method returns the value of the video description
  # Parameteres : None
  # Returns : description - string
  # Approach : Just selecting the value of the current video description from the database
  # Time Complexity : O(n)
  # Author : Hussien M. Eloy
  def get_description
    self[:description]
  end

  # This method returns the value of the video category
  # Parameteres : None
  # Returns : category - string
  # Approach : Just selecting the value of the current video category from the database
  # Time Complexity : O(n)
  # Author : Hussien M. Eloy
  def get_category
    self[:category]
  end

  # This method edits the description of the video
  # Parameters : description - string
  # Returns : None
  # Approach : It just updates the description column in the current 
  # video recored by the value of the parameter
  # Time Complexity : O(n)
  # Author : Hussien M. Eloy
  def edit_description(description)
    self[:description] = description
  end

  # This method edits the category of the video
  # Parameters : category - string
  # Returns : None
  # Approach : It just updates the category column in the current 
  # video recored by the value of the parameter
  # Time Complexity : O(n)
  # Author : Hussien M. Eloy
  def edit_category(category)
    self[:category] = category
  end
    
  # This method returns the comments associated with video
  # Parameters : None
  # Returns : comments - table of comments
  # Approach : Just selecting the comments associated 
  # with the current video  from the database
  # Time Complexity : O(n)
  # Author : Hussien M. Eloy
  def get_comments
    # self.comments
  end

  # This method adds new comment to the comments of the current video 
  # Parameters : comment - Comment
  # Returns : None
  # Approach : TBA
  # Time Complexity : TBA
  # Author : Hussien M. Eloy
  def write_comment(comment)
  end

  # This method returns the tags associated with video
  # Parameters : None
  # Returns : tags - table of tags
  # Approach : Just selecting the tags associated 
  # with the current video  from the database
  # Time Complexity : O(n)
  # Author : Hussien M. Eloy
  def get_tags
    # self.tags
  end
  
  # This method tags new user to  the current video 
  # Parameters : registered_user - RegisteredUser
  # Returns : None
  # Approach : TBA
  # Time Complexity : TBA
  # Author : Hussien M. Eloy
  def tag_someone(registered_user)
  end

  # This method returns all videos related to the current video 
  # Parameters : None
  # Returns : videos - table of videos
  # Approach : TBA
  # Time Complexity : TBA
  # Author : Hussien M. Eloy    
  def get_related_videos
  end

  # This method returns the keywords associated with video
  # Parameters : None
  # Returns : keywords - table of keywords
  # Approach : Just selecting the keywords associated 
  # with the current video  from the database
  # Time Complexity : O(n)
  # Author : Hussien M. Eloy
  def get_keywords
    # self.keywords
  end
  
  # This method adds new keyword to the keywords of the current video 
  # Parameters : keyword - Keyword
  # Returns : None
  # Approach : TBA
  # Time Complexity : TBA
  # Author : Hussien M. Eloy
  def add_keyword(keyword)
  end

end

