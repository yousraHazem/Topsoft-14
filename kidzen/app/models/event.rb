class Event < ActiveRecord::Base
	 #validation
	 #Author: Nouran Mamdouh
	validates_presence_of :name , :location

end
