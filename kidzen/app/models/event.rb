class Event < ActiveRecord::Base
  #validation of name and location
  #Author: Nouran Mamdouh
  mount_uploader :image, ImageUploader
  validates_presence_of :name , :location
  searchkick autocomplete: [:name]	
end
