# Controller for notifications
# Authors: Ahmed H. Ismail
class NotificationsController < WebsocketRails::BaseController
  helper NotificationActionHelper
  before_action :set_user

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
  end

  # Lists unread notifications only.
  # Authors: Ahmed H. Ismail.
  def pending 
      notifications = @user.pending_notifications
      message :pending_notifications 
  end


  private 

  # Triggers a failure event if 
  # No one is currently logged in.
  # Authors: Ahmed H. Ismail.
  def  set_user
    if signed_in?
      @user = current_user
    else
      trigger_failure "signin"
    end
  end

end
