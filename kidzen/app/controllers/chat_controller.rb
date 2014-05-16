class ChatController < ApplicationController
  def index
    @chat = Chat.all
  end
  

  # This is a method that creates a new chat conection
  # Author: Mohamed Bahgat Elrakaiby
  def create
    @chat = Chat.create!(params[:chat])
  end
end
