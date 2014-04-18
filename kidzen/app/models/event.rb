class Event < ActiveRecord::Base
    #validation
	validates_presence_of :name , :location
end
