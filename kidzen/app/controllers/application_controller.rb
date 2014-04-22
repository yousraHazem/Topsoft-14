class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_locale

  # This is function changes the language of the system from Ar to En or vice versa.
  # Time complexity: O(1).
  def change_locale
	session[:locale]= params[:locale]
	redirect_to :back, notice: "Your language has been changes to #{params[:locale]}"
  end
  
  #This is function check the current language of the system.
  #Time complexity: O(1).
  private
  def check_locale
  	I18n.locale = session[:locale] || :en
  end
end
