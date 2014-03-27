class GroupMembersController < ApplicationController
  before_action :set_group_member, only: [:show, :edit, :update, :destroy]

  # GET /group_members
  # GET /group_members.json
  def index
    @group_members = GroupMember.all
  end

  # GET /group_members/1
  # GET /group_members/1.json
  def show
  end

  # GET /group_members/new
  def new
    @group_member = GroupMember.new
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_member
      @group_member = GroupMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_member_params
      params.require(:group_member).permit(:group_id, :username, :invite, :accept)
    end

    #start of my methods
    
    # This is a function that adds a member to the group by his name.
    # Time complexity: O(1).
    #Authors: Mohammed T. Nabih.
    def add_member_name(name)
        
    end

    # This is a function that adds a member to the group by his email.
    # Doesn't return anything.
    #Time complexity: O(n).
    #Authors: Mohammed T. Nabih.
    def add_member_email(email)
  
    end

    # This is a function that adds a member to the group by his phone number.
    # Doesn't return anything.
    # Time complexity: O(n).
    #Authors: Mohammed T. Nabih.
    def add_member_phone(phone)
  
    end

    # This is a function that allows  a registered user to accept the invitation from other users' group.
    # Doesn't return anything.
    # Time complexity: O(1).
    #Authors: Mohammed T. Nabih.
    def accept_invitation
       m = GroupMember.where(:username => params[:username],:group_id => params[:group_id])
       m.accept=1
       m.save
    end
    
    # This is a function that allows the user to send request to a group.
    # Doesn't return anything.
    # Time complexity: O(1).
    #Authors: Mohammed T. Nabih.
    def join_request
      r= GroupMember.new(:group_id => params[:group_id])
      r.accept = 2
      r.save
    end
end
