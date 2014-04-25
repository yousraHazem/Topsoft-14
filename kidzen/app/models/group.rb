class Group < ActiveRecord::Base
	searchkick autocomplete: [:group_name]
end
