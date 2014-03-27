class UserController < ApplicationController

	def change_locale
	  session[:locale]= params[:locale]
	  redirect_to :back, notice: "Your lang	age has been changes to #{params[:locale]}"
	end

end
