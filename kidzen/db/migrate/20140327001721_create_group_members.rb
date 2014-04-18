class CreateGroupMembers < ActiveRecord::Migration
  def change
    create_table :group_members do |t|
      t.integer :group_id
      t.string  :username
      t.integer :owner_accept_state
      t.integer :member_accept_state
      t.timestamps
    end
  end
end
