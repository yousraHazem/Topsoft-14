class CreateChatrooms < ActiveRecord::Migration
  def change
    create_table :chatrooms do |t|
    	t.string :chatroom_name
    	t.string :creator_username
    	t.boolean :invite_only
    	t.boolean :mutual_only
    	
    	t.timestamps
    end
  end
end
