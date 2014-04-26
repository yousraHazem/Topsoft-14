class FixFriendship < ActiveRecord::Migration
  def change
    rename_column("friendships","child_1_id","child1_id")
  	rename_column("friendships","child_2_id","child2_id")
  end
end
