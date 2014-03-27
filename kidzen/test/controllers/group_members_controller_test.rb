require 'test_helper'

class GroupMembersControllerTest < ActionController::TestCase
  setup do
    @group_member = group_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_member" do
    assert_difference('GroupMember.count') do
      post :create, group_member: { accept: @group_member.accept, group_id: @group_member.group_id, invite: @group_member.invite, username: @group_member.username }
    end

    assert_redirected_to group_member_path(assigns(:group_member))
  end

  test "should show group_member" do
    get :show, id: @group_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_member
    assert_response :success
  end

  test "should update group_member" do
    patch :update, id: @group_member, group_member: { accept: @group_member.accept, group_id: @group_member.group_id, invite: @group_member.invite, username: @group_member.username }
    assert_redirected_to group_member_path(assigns(:group_member))
  end

  test "should destroy group_member" do
    assert_difference('GroupMember.count', -1) do
      delete :destroy, id: @group_member
    end

    assert_redirected_to group_members_path
  end
end
