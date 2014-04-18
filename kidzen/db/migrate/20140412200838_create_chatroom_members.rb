class CreateChatroomMembers < ActiveRecord::Migration
  def change
    create_table :chatroom_members do |t|
    t.integer :chatroom_id
    t.string :username
    t.integer :creator_accept_state
    t.integer :member_accept_state
    t.timestamps
    end
  end
end
