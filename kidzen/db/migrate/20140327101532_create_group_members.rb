class CreateGroupMembers < ActiveRecord::Migration
  def change
    create_table :group_members do |t|
      t.int :group_id
      t.string :username
      t.int :invite
      t.int :accept

      t.timestamps
    end
  end
end
