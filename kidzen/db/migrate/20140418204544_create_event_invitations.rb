class CreateEventInvitations < ActiveRecord::Migration
  def change
  	create_table :event_invitations do |t|
      t.boolean :accept
      t.integer :event_id
      t.integer :inviter_id
      t.integer :invited_id
      t.timestamps
    end
    add_index(:event_invitations, [:inviter_id, :invited_id], unique: true)
  end
end
