class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_locale
  #before_action :authenticate_user!
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  def change_locale
	session[:locale]= params[:locale]
	redirect_to :back, notice: "Your language has been changes to #{params[:locale]}"
  end
  
  private
    def check_locale
    	I18n.locale = session[:locale] || :en
    end
    
  protected

    def configure_devise_permitted_parameters
      registration_params = [:first_name, :family_name, :username, :nickname, :middle_name, :banned, :gender, :birth_date, :email, :password, :password_confirmation]

      if params[:action] == 'update'
        devise_parameter_sanitizer.for(:account_update) { 
          |u| u.permit(registration_params << :current_password)
      }
      elsif params[:action] == 'create'
        devise_parameter_sanitizer.for(:sign_up) { 
          |u| u.permit(registration_params) 
        }
      end
    end

end
