class CreateBannedChatroomMembers < ActiveRecord::Migration
  def change
    create_table :banned_chatroom_members do |t|
    	t.integer :chatroom_id
    	t.string :username

    	t.timestamps
    end
  end
end
