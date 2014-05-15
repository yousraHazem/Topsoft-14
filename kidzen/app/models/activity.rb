class Activity < ActiveRecord::Base
  belongs_to :content_provider
	searchkick autocomplete: [:name]
end
