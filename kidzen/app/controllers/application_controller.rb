class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_locale


  private

  def check_locale
  	I18n.locale = session[:locale] || :en
  end
end
