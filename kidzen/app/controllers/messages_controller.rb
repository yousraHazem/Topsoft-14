class MessagesController < ApplicationController

  def index #auto generated
    @user = current_user
    @messages = Message.order("created_at desc")
    respond_to do |format|
      format.html
      format.json { render json: @messages }
    end
  end

  def show #shows messages to user as it checks if the user is the receiver or sender of msg , author :ali , complexity o(n)
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

  def new#creates new message auto generated
    @message = Message.new
  end

  def create#creates new message , author ali , complexity o(1)
    @message = Message.new(m_params)
    @message.sender = current_user.email
    @message.save
    
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

  private    

  def m_params#required to define variables for rails 4 as attr_accesible not usable in rails 4 , author ali , complexity o(1)
    params.require(:message).permit(:subject, :body, :sender, :recepient, :read)
  end

  def destroy#searches for the message and deletes the message from the database , author ali , complexity o(n)
    @message = Message.find(params[:id])
    @message.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
  end
  end
  
end