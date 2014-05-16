class ChatroomController < ApplicationController
  include ActionView::Helpers::SanitizeHelper
  # A method that initializes a new session.
  # Author: Mohamed Bahgat Elrakaiby.
  def initialize_session
    puts "Session Initialized\n"
  end
  
  # A method that broadcasts a message to the server.
  # Author: Mohamed Bahgat Elrakaiby.
  def system_msg(ev, msg)
    broadcast_message ev, { 
      user_name: 'system', 
      received: Time.now.to_s(:short), 
      msg_body: msg
    }
  end
  
  # A method that broadcasts a message to the users.
  # Author: Mohamed Bahgat Elrakaiby.
  def user_msg(ev, msg)
    broadcast_message ev, { 
      user_name:  connection_store[:user][:user_name], 
      received:   Time.now.to_s(:short), 
      msg_body:   ERB::Util.html_escape(msg) 
      }
  end
  
  # A method that shows to the room that a specific client connected to the room.
  # Author: Mohamed Bahgat Elrakaiby.
  def client_connected
    system_msg :new_message, "client #{client_id} connected"
  end
  
  # A method that creates a new message.
  # Author: Mohamed Bahgat Elrakaiby.
  def new_message
    user_msg :new_message, message[:msg_body].dup
  end
  
  # A method that creates a new user.
  # Author: Mohamed Bahgat Elrakaiby.
  def new_user
    connection_store[:user] = { user_name: sanitize(message[:user_name]) }
    broadcast_user_list
  end

  # A method that changes the username of a user.
  # Author: Mohamed Bahgat Elrakaiby.
  def change_username
    connection_store[:user][:user_name] = sanitize(message[:user_name])
    broadcast_user_list
  end

  # A method that deletes a user.
  # Author: Mohamed Bahgat Elrakaiby.
  def delete_user
    connection_store[:user] = nil
    system_msg "client #{client_id} disconnected"
    broadcast_user_list
  end
  
  # A method that broadcasts a message to the users.
  # Author: Mohamed Bahgat Elrakaiby.
  def broadcast_user_list
    users = connection_store.collect_all(:user)
    broadcast_message :user_list, users
  end
end
