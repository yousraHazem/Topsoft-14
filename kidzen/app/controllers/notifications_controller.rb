# WebSocket controller for Notifications namespace.
# Authors: Ahmed H. Ismail
class NotificationsController < WebsocketRails::BaseController
  # helper NotificationActionHelper
  before_action :set_user
  before_action :set_notification, only: [:mark_read, :mark_unread]

  # Called the first time a controller is set up.
  # Which is when a controller is subscribed 
  # to an event.
  # Authors: Ahmed H. Ismail.
  def initialize_session

  end

  # Lists all notifications.
  # Read and undread.
  # Authors: Ahmed H. Ismail.
  def index
    send_message :index, @user.all_notifications, namespace: :notifications
  end

  # Lists unread notifications only.
  # Authors: Ahmed H. Ismail.
  def pending 
    send_message :pending, @user.pending_notifications, namespace: :notifications
  end

  # Marks a notification as read.
  # Authors: Ahmed H. Ismail
  def mark_read
    @notification.mark_read!
    message = {status: :ok}
    send_message :mark_read, message, namespace: :notifications
  end

  def mark_unread
    @notification.mark_unread!
    message = {status: :ok}
    send_message :mark_read, message, namespace: :notifications
  end

  private 

  # Triggers a failure event if 
  # no one is currently logged in.
  # Authors: Ahmed H. Ismail.
  def  set_user
    if signed_in?
      @user = current_user
    else
      trigger_failure "signin"
    end
  end

  # Before filter for setting 
  # notification instance variable.
  # Expects notification id as id in message.
  # Authors: Ahmed H. Ismail.
  def set_notification
    if message.has_key?(:id) && Notification.exists?(message[:id])
      @notification = Notification.find(message[:id])
    else
      trigger_failure "id"
    end
  end

end
