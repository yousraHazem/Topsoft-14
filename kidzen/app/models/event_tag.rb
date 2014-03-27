#Author:Nouran Mamdouh
class EventTag < ActiveRecord::Base
	# the foreign key refers to table event
    belongs_to :event
end
