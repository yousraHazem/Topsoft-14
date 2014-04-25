class GroupMember < ActiveRecord::Base
  # GroupMember Model , has a many to many relation with groups
  has_and_belongs_to_many :groups
end