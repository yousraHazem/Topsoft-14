# Represents a possible action on a notification.
# Authors: Ahmed H. Ismail
class NotificationAction < ActiveRecord::Base
  belongs_to :notification
end
