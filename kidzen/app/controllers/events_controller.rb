class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  
  #This method to assign variable friends to child's friends
  #Parameters : None
  #Returns : None
  #Approach : view child's friends
  #Time Complexity : O(n)
  #Author : Nouran Mamdouh
  def view_friends
    @child = Child.where("registered_user_id=#{current_user.id}").first
    @friends = @child.friends
  end

  #GET /events
  #GET /events.json
  #This method view all the events in model Event in index (home)page
  #Assign variable events to all records in table Event
  #Parameters :None
  #Returns : None
  #Approach : view all the events created 
  #Time Complexity : O(1)
  #Author : Nouran Mamdouh
  def index
    @events = Event.all
  end

  #GET /events/1
  #GET /events/1.json
  def show
  end

  #GET /events/new
  #This method creates a new event .
  #Assign variable event to new instance  
  #Parameters :None
  #Returns : None
  #Approach : create a new event created
  #Time Complexity : O(1)
  #Author : Nouran Mamdouh
  def new
    @event = Event.new
  end

  #GET /events/1/edit
  def edit
  end
  #POST /events
  #POST /events.json
  #This method creates a new event after submitting the form with the variables
  #Parameters : event parameters
  #Returns : None
  #Approach : save the new event instance to the event model
  #Time Complexity : O(n)
  #Author : Nouran Mamdouh
  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  #PATCH/PUT /events/1
  #PATCH/PUT /events/1.json
  #This method updates an existing event viewing a message Event was successfully updated.
  #Parameters : event parameters
  #Returns : None
  #Approach : update the event 
  #Time Complexity : O(n)
  #Author : Nouran Mamdouh
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  #DELETE /events/1
  #DELETE /events/1.json
  #This method deletes an existing event 
  #Parameters : None
  #Returns : None
  #Approach : delete specific event 
  #Time Complexity : O(n)
  #Author : Nouran Mamdouh
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  
  private
    #Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    #Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:location, :name, :date_time, :description)
    end
end
