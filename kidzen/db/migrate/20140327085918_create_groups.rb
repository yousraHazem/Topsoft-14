class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.RegisteredUser :owner
      t.String :name
      t.array :statuses
      t.String :info
      t.int :numberOfMembers
      t.array :members

      t.timestamps
    end
  end
end
