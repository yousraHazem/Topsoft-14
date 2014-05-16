class Event < ActiveRecord::Base
# Validation of name and location
# Author: Nouran Mamdouh
  validates_presence_of :name , :location
  searchkick autocomplete: [:name]	
  belongs_to :child
# Author: Nouran Mamdouh
def friend_name
	child.name if @friends = child.friends
end
# This method finds child's friend in searching field
# Author: Nouran Mamdouh
def friend_name=(name)
  self.child = Child.find_by_name(name) unless name.blank?
