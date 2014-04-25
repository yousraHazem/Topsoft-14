module MessagesHelper
  def marked_as_read(message)
    if @message.read != 1 
      @message.read = 1
      @message.save 
    end
  end
end
# This module's function is when the message is opened it is marked as read and read by user sign desplayed to it
# Complexity O(n)
# Author: Ali A. El-Halawaty .
