module MessagesHelper#when the message is opened it is marked as read and read by user sign desplayed to it , author ali , complexity o(n)
  def marked_as_read(message)
    if @message.read != 1 
      @message.read = 1
      @message.save 
    end
  end
end