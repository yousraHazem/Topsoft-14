class CreateFriendship < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
        t.integer :child_1_id
        t.integer :child_2_id
        t.timestamps
    end
    add_index(:friend_ships, [:child_1_id, :child_2_id], unique:  true)
  end
end
