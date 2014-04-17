class SupervisorsController < ApplicationController
  
  # GET /confirm_children
  # Authors: Ahmed H. Ismail
  def confirm_children
    @children = @supervisor.pending_children
  end
end
