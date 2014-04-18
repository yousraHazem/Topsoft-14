# Controller for notifications
# Authors: Ahmed H. Ismail
class NotificationsController < ApplicationController
  helper NotificationActionHelper
  # GET /notifications/pending
  # Lists notifications for currently logged in user.
  # Authors: Ahmed H. Ismail
  def pending
    @notifications = @loged_in_user.pending_notifications # get pending notifications
    respond_to do |format|
      format.html { render layout: false  }
    end
  end


end
