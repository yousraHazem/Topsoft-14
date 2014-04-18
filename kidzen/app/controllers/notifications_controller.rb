# Controller for notifications
# Authors: Ahmed H. Ismail
class NotificationsController < ApplicationController
  
  # GET /notifications/pending
  # Lists notifications for currently logged in user.
  # Authors: Ahmed H. Ismail
  def pending
    @notifications # all notifications
    respond_to do |format|
      format.html { render layout: false  }
    end
  end


end
