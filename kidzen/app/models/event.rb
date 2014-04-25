class Event < ActiveRecord::Base
	searchkick autocomplete: [:name]	
end
