 class CalendarController < ApplicationController
# This method is used to create a calendar using the date
# Parameters : None
# Returns : None
# Time Complexity : O(1)
# Author : Abdelrahman Saad
  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
