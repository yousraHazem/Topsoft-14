# Helpers for NotificationAction
# Authors: Ahmed H. Ismail
module NotificationActionHelper

  # onclick attribute for NotificationAction
  # action - NotificationAction
  # Authors: Ahmed H. Ismail
  def on_click(action)
    if action.async?
      "onlick=\"notification_action_click(\'#{action.url}\', \'#{action.notification_id}\', \'#{action.data}\')\""
    else
      ''
    end
  end
end