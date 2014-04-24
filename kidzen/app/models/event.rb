class Event < ActiveRecord::Base
    #validation
	validates_presence_of :name , :location

	def self.search(search)
  search_condition = "%" + search + "%"
  find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
end


end
