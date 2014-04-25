# Controller for notifications
# Authors: Ahmed H. Ismail
class NotificationsController < ApplicationController
  helper NotificationActionHelper

  # GET /notifications/pending
  # Lists notifications for currently logged in user.
  # Authors: Ahmed H. Ismail
  def pending
    # First we need to find out if someone is logged in
    if signed_in?
      @notifications = current_user.pending_notifications
      render layout: false
    else
      # No one signed in
      render layout: false, nothing: true
    end
  end



end
