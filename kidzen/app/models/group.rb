class Group < ActiveRecord::Base
  # Group Model , has one to many relation with GroupMember
  # Authors: Nouran T. Attia and Mohammed T. Nabih
  has_many :group_members
  
  #Validations
  validates_presence_of :owner
  validates :group_name, presence: true, length: { minimum: 4, maximum: 16}, uniqueness: true
  validates :group_description, presence: true
end
