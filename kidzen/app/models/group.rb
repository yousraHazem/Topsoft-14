class Group < ActiveRecord::Base
  # Group Model , has a many to many relation with GroupMember
  has_and_belongs_to_many :group_members
end
