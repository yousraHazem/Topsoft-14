class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  #Start autogenerated methods
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    # @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  # Method for creating a new group.
  # group_params - hash.
  # Insertion of a new record in table groups.
  # The function takes a unique username, and a group_name and
  # creates a new group by creating and inserting a
  # new record in table groups.
  # Has error reporting for missing or misused fields.
  # Complexity: O(1).
  # Author: Nouran T. Attia, Mohammed T. Nabih.
  def create
    if signed_in?
      @group = Group.new(group_params)
      @group.owner = current_user.username
      if !@group.valid?
        flash[:error] = @group.errors.full_messages.join("<br>").html_safe
      end
      respond_to do |format|
        if @group.save
          format.html { redirect_to @group, notice: 
            'Group was successfully created.' }
          format.json { render action: 'show', status: :created,
            location: @group }
        else
          format.html { render action: 'new' }
          format.json { render json: @group.errors,
            status: :unprocessable_entity }
        end
      end
    else
      # No one signed in
      redirect_to session_path :new
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice:
          'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group.errors,
          status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  # Auto generated code modified by : Mohammed Tarek Nabih
  def destroy
    @group = Group.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  # This is a function that allows a user to leave a group.
  # It retrieves the record to be deleted, save it in member then deletes it from the database.
  # No input, no output.
  # Returns nothing.
  # Time complexity: O(1).
  # Author: Mohamed Bahgat Elrakaiby.
  def leave_group
    if signed_in?
      member = GroupMember.where(:username => current_user.username, :group_id => params[:id])
      if member.blank?
        redirect_to "/group_members/:id/not_member"
      else
        member.destroy_all
        redirect_to '/group_members/:id/leave_group'
      end
    else
    redirect_to session_path :new
    end
  end  

  # This is a function that allows a user to join a group.
  # It checks first if the user is already a member, otherwise it insert it in a database for approval.
  # No input, no output.
  # Returns nothing.
  # Time complexity: O(1).
  # Author: Mohamed Bahgat Elrakaiby.
  def join_group
    if signed_in?
      member = GroupMember.where(:username => current_user.username, :group_id => params[:id])
      unless member.blank?
        redirect_to "/group_members/:id/already_member"
      else
        member = GroupMember.new(:username => current_user.username,
        :group_id => params[:id], :owner_accept_state => 2)
        member.save
        redirect_to '/group_members/:id/join_group'
      end
    else
    redirect_to session_path :new
    end
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    

    # Never trust parameters from the scary internet,
    # only allow the white list through.
    def group_params
      params.require(:group).permit(:group_name, :privacy,
        :group_description)
    end

    # End of autogenerated methods
  #end
end
