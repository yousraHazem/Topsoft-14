class Group < ActiveRecord::Base
  # Group Model , has a many to many relation with GroupMember
  validates_presence_of :owner, :group_name, :group_description
  has_and_belongs_to_many :group_members
	searchkick autocomplete: [:group_name]
end
