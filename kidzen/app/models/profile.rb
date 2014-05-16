class Profile < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
