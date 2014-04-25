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



  # Adds actions for child creation notification
  # child - child for which notification actions are being created
  # returns list of unsaved actions
  # Authors: Ahmed H. Ismail
  def add_child_creation_actions(child)
    accept_action_params = Hash.new
    accept_action_params[:async] = true
    accept_action_params[:name] = "Accept" # Internationalize
    accept_action_params[:url] = "supervisor/accept_child"
    accept_action_params[:data] = "{child_username: #{child.username}}"
    accept_action = add_action(accept_action_params)

    reject_action_params = Hash.new
    reject_action_params[:async] = true
    reject_action_params[:name] = "Reject" # Internationalize
    reject_action_params[:url] = "supervisor/reject_child"
    reject_action_params[:data] = "{child_username: #{child.username}}"
    reject_action = add_action(reject_action_params)

    return [accept_action, reject_action]
  end



end
