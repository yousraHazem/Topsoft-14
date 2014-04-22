class GroupMembersController < ApplicationController
  before_action :set_group_member, only: [:show, :edit, :update, :destroy]

  # GET /group_members
  # GET /group_members.json
  def index
  end

  # GET /group_members/1
  # GET /group_members/1.json
  def show
  end

  # GET /group_members/new
  def new
    #@group_member = GroupMember.new
  end

  # GET /group_members/1/edit
  def edit
  end

  # POST /group_members
  # POST /group_members.json
  def create
    @group_member = GroupMember.new(group_member_params)

    respond_to do |format|
      if @group_member.save
        format.html { redirect_to @group_member, notice: 'Group member was successfully created.' }
        format.json { render action: 'show', status: :created, location: @group_member }
      else
        format.html { render action: 'new' }
        format.json { render json: @group_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_members/1
  # PATCH/PUT /group_members/1.json
  def update
    respond_to do |format|
      if @group_member.update(group_member_params)
        format.html { redirect_to @group_member, notice: 'Group member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_members/1
  # DELETE /group_members/1.json
  def destroy
    @group_member.destroy
    respond_to do |format|
      format.html { redirect_to group_members_url }
      format.json { head :no_content }
    end
  end

  # Method for viewing the join requests sent to the group
  # group_id-integer
  # the method returns a container of the member requests to the group containg the username, and the id of the group to join
  # The function takes a group_id, and returns the members with pending requests
  # Author: Nouran T. Attia
  def membership_requests
    @group_members = GroupMember.where(:group_id => params[:group_id], :owner_accept_state => 2)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_member
      @group_member = GroupMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_member_params
      params.require(:group_member).permit(:group_id, :username)
    end
end
