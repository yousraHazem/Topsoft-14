# This is Puzzle Model that is used to make content provider upload Photos to be used in a puzzle
# Author : Moaz El-Nashar
class Puzzle < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	validates :description, presence: true
  validates :image, presence: true
end