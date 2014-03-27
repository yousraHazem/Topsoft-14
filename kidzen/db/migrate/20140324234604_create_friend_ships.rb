class CreateFriendShips < ActiveRecord::Migration
  def change
    create_table :friend_ships do |t|
      t.integer :child_1_id
      t.integer :child_2_id

      t.timestamps
    end
  end
end
