class Event < ActiveRecord::Base
  #Validation of name and location
  #The uploading process mostly happens with usage of CarrierWave Gem
  #Author: Nouran Mamdouh
  mount_uploader :image, ImageUploader
  validates_presence_of :name , :location
  searchkick autocomplete: [:name]	
end
