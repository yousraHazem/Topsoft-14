module NotificationActionHelper
  # onclick attribute for NotificationAction
  # action - NotificationAction
  # Authors: Ahmed H. Ismail
  def on_click(action)
    if action.async?
      'onlick="notification_action_click(action.url, action.notification_id)"'
    else
      ""
    end
  end
end