class CreateEventInvitations < ActiveRecord::Migration
  def change
  	create_table :event_invitations do |t|
      t.integer :event_id
      t.integer :inviter_id
      t.integer :invited_id
      t.timestamps
    end
  end
end
