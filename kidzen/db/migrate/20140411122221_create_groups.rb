class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :owner
      t.string :group_name
      t.string :privacy
      t.string :group_description
      t.integer :member_count
      t.timestamps
    end
  end
end
