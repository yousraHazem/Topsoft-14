# Model representing all notification
# Authors: Ahmed H. Ismail
class Notification < ActiveRecord::Base
  validates :title, presence: true
  validates :short_desc, presence: true
  validates :long_desc, presence: true
  has_many :notification_actions, dependent: :destroy
  belongs_to :registered_user, foreign_key: 'assigned_to', primary_key: 'username'
  before_save :default_values

  # Sets default values
  # Authors: Ahmed H. Ismail
  def default_values
    self[:pending] = true
  end

  # Retrives list of associated actions.
  # Authors: Ahmed H. Ismail
  def actions
    NotificationActions.where(notification_id: id)
  end

  # Adds a notification action.
  # to be associated with this notification
  # params - hash of params for NotificationAction, Modified by function.
  # returns the new action. Note it is not saved
  # to the db
  # Authors: Ahmed H. Ismail
  def add_action(params)
    params[:notification_id] = id
    NotificationAction.new(params)
  end

  # Marks a notification as read.
  # Authors: Ahmed H. Ismail
  def mark_read
    pending = false
  end

  # Marks a notification as unread
  # Authors: Ahmed H. Ismail
  def mark_unread
    pending = true
  end


end
