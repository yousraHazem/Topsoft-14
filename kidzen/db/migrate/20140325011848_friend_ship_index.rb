class FriendShipIndex < ActiveRecord::Migration
  def change
        add_index(:friend_ships, [:child_1_id, :child_2_id], unique:  false)
  end
end
