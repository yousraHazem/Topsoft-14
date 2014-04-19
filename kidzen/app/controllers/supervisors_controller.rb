# Supervisor controller
# Authors: Ahmed H. Ismail
class SupervisorsController < ApplicationController
  before_action :grab_pending_child_by_name, only: [:accept_child, :reject_child]
  before_action :set_supervisor, except: [] # set for all
  before_action :authenticate_registered_user!
  wrap_parameters format: [:json], include: [:child_username]

  # GET /confirm_children
  # Renders the confirm children
  # view.
  # Authors: Ahmed H. Ismail
  def confirm_children
    @children = @supervisor.pending_children
  end

  # PUT /supervisor/reject_child
  # Accept child action.
  # Authors: Ahmed H. Ismail
  def accept_child
    respond_to do |format| 
      msg =  {status: "ok"}
      format.json { render json: msg }
      format.html { redirect_to  :confirm_children }
    end
  end

  # PUT /supervisor/accept_child
  # Reject child action.
  # Authors: Ahmed H. Ismail
  def reject_child
    respond_to do |format|
      msg = {status: "ok"}
      format.json { render json: msg }
      format.html { redirect_to :confirm_children }
    end
  end

  private

  # Safety first.
  # Authors Ahmed H. Ismail
  def supervisor_params
    params.require(:supervisor).permit(:user_name)
  end

  # Sets supervisor instance var to 
  # the currently logged in supervisor or nil
  # if none.
  # Authors: Ahmed H. Ismail
  def set_supervisor
    logged_in_user = current_registered_user # Of type Registered user
    @supervisor = Supervisor.find(logged_in_user.id) if !logged_in_user.nil?
  end


end
