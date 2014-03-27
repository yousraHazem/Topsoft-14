class CreateGroupMembers < ActiveRecord::Migration
  def change
    create_table :group_members do |t|
      t.integer :group_id
      t.string  :username
      t.integer :invitation
      t.integer :accept
      t.timestamps
    end
  end
end
