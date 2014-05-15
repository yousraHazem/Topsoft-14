class Activity < ActiveRecord::Base
	searchkick autocomplete: [:name]
belongs_to :topic
has_many :activity_accounts
has_many :children, :through=>:activity_accounts
end
