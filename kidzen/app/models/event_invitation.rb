class EventInvitation < ActiveRecord::Base
  #Associations
  #Author : Nouran Mamdouh
  belongs_to :inviter, :class_name => 'EventInvitation', :foreign_key =>'inviter_id'
  belongs_to :invited, :class_name => 'EventInvitation', :foreign_key =>'invited_id'
  #Validations
  #Author : Nouran Mamdouh
  validates :child_1_id, presence: true
  validates :child_2_id, presence: true

end
