class Event < ActiveRecord::Base
	 #validation
	 #Author: Nouran Mamdouh
	validates_presence_of :name , :location
#COMMMEEENNNNTTT
	attr_accessor :month, :day, :year
validate :validate_created_at

private

def convert_created_at
  begin
    self.created_at = Date.civil(self.year.to_i, self.month.to_i, self.day.to_i)
  rescue ArgumentError
    false
  end
end

def validate_created_at
  errors.add("Created at date", "is invalid.") unless convert_created_at
end

end
