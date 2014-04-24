# Model representing all notification
# Authors: Ahmed H. Ismail
class Notification < ActiveRecord::Base
  validates :title, presence: true
  validates :short_desc, presence: true
  validates :pending, inclusion: [true, false]
  has_many :notification_actions, dependent: :destroy
  belongs_to :registered_user, foreign_key: 'assigned_to', primary_key: 'username'

  # Retrives list of associated actions.
  # Authors: Ahmed H. Ismail
  def actions
    notification_actions
  end

  # Adds a notification action.
  # to be associated with this notification
  # params - hash of params for NotificationAction, Modified by function.
  # returns the new action. Note it is not saved
  # to the db
  # Authors: Ahmed H. Ismail
  def add_action(params)
    params[:notification] = self
    NotificationAction.new(params)
  end

  # Marks a notification as read.
  # Authors: Ahmed H. Ismail
  def mark_read
    self[:pending] = false
  end

  # Marks a notification as unread
  # Authors: Ahmed H. Ismail
  def mark_unread
    self[:pending] = true
  end



  # Adds actions for child creation notification
  # child - child for which notification actions are being created
  # returns list of unsaved actions
  # Authors: Ahmed H. Ismail
  def add_child_creation_actions(child)
    accept_action_params = Hash.new
    accept_action_params[:async] = true
    accept_action_params[:name] = "Accept" # Internationalize
    accept_action_params[:url] = "supervisors/accept_child"
    accept_action_params[:data] = "{child_username: #{child.registered_user.username}}"
    accept_action = add_action(accept_action_params)

    reject_action_params = Hash.new
    reject_action_params[:async] = true
    reject_action_params[:name] = "Reject" # Internationalize
    reject_action_params[:url] = "supervisors/reject_child"
    reject_action_params[:data] = "{child_username: #{child.registered_user.username}}"
    reject_action = add_action(reject_action_params)

    return [accept_action, reject_action]
  end

  # Adds actions for reported post notification
  # post - post in question
  # returns list of unsaved actios
  # Authors: Ahmed H. Ismail
  def add_post_reported_actions(post)
    # TODO: Implement when post is implemented.
    return []
  end


end
