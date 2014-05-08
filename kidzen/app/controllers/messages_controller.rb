class MessagesController < ApplicationController

  # This function indexes the messages by the most sent message or received message desplayed first
  # @message instant user of a type message.
  # @user instant user of type registered user.
  # Complexity o(n).
  # Authors: Ali A. El-Halawaty .
  def index 
    @user = current_user
    @messages = Message.order("created_at desc")
    respond_to do |format|
      format.html
      format.json { render json: @messages }
    end
  end
  
  # This function shows messages to user as it checks if the user is the receiver or sender of message.
  # The user must be related to the message either he is a sender or a receiver .
  # @message instant user of a type message.
  # @user instant user of type registered user.
  # Complexity O(n).
  # Authors: Ali A. El-Halawaty .
  def show 
    @message = Message.find(params[:id])
    @user = current_user
    if (@user.email == @message.sender) || (@user.email == @message.recepient)
    else
      respond_to do |format|
        format.html { redirect_to :action => :index, notice: 'No message found' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
    end
    end
  end
  

  #auto generated
  def new
    @message = Message.new
  end

  # This function creates new message by passing parameters to it form m_params function 
  # and saves it in the table and if the message saved succes message will emerge else failure message .
  # Complexity o(1) .
  # Authors: Ali A. El-Halawaty .
  def create
    @message = Message.new(m_params)
    @message.sender = current_user.email
    if RegisteredUser.where(:email => @message.recepient)
       @message.save
     end 
    
    
    respond_to do |format|
      if @message.save
        format.html { redirect_to :action => :index, notice: 'Message has been sent.' }
        format.json { render json: @messages }
      else
        format.html { redirect_to :action => :new, notice: 'Error: Please try again.' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
      end
  end

  # This function searches for the message and deletes the message from the table
  # Complexity o(n)
  # Authors: Ali A. El-Halawaty .
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
      respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      end
  end


  




  private 
  # This function is required to define variables for rails 4 as attr_accesible not usable in rails 4 .
  # Complexity o(1) .
  # Authors: Ali A. El-Halawaty .   
  def m_params
    params.require(:message).permit(:subject, :body, :sender, :recepient, :read)
  end
end



