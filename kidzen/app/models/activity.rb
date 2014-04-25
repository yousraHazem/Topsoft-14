class Activity < ActiveRecord::Base
	searchkick autocomplete: [:name]
end
