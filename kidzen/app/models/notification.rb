# Model representing all notification
# Authors: Ahmed H. Ismail
class Notification < ActiveRecord::Base
  validates :title, presence: true
  validates :short_desc, presence: true
  validates :long_desc, presence: true
  has_many :notification_actions, dependent: :destroy
  belongs_to :registered_user, foreign_key: 'assigned_to', primary_key: 'username'
end
