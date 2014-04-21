class Event < ActiveRecord::Base
<<<<<<< HEAD
    #validation
	validates_presence_of :name , :location
=======
	def self.search(search)
  search_condition = "%" + search + "%"
  find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
end

>>>>>>> e9443e5ee32b01b027e49403e83a58cf9e2f2a40
end
