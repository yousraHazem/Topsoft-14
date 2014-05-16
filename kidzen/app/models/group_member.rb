class GroupMember < ActiveRecord::Base
  # GroupMember Model , has a many to many relation with Group Model
  # Authors: Nouran T. Attia and Mohammed T. Nabih
  belongs_to :groups
end