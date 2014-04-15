class CreateChatroomLog < ActiveRecord::Migration
  def change
    create_table :chatroom_logs do |t|
    	t.integer :chatroom_id
      t.string :sender_username
      t.string :message_content
      t.timestamps
    end
  end
end
