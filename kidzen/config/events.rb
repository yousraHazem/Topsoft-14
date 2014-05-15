WebsocketRails::EventMap.describe do
  # Notification Events start.
  # Authors: Ahmed H. Ismail.
  namespace :notifications do
    subscribe :pending, 'notifications#pending'
    subscribe :index, 'notifications#index'
    subscribe :mark_read, 'notifications#mark_read'
    subscribe :mark_unread, 'notifications#mark_unread'
    subscribe :subscribe, 'notifications#subscribe'    
  end
  # Notification Events end.

end
