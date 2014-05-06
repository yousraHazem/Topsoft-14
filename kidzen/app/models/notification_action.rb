# Represents a possible action on a notification.
# Authors: Ahmed H. Ismail
class NotificationAction < ActiveRecord::Base
  belongs_to :notification

  # Returns the proper format
  # for transporting over WebSocket
  # to clients.
  # Authors: Ahmed H. Ismail
  def hashify
  end

end
