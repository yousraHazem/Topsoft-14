class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
        t.integer :child_1_id
        t.integer :child_2_id
	t.string :status
        t.timestamps
    end
    add_index(:friendships, [:child_1_id, :child_2_id], unique:  true)
  end
end
