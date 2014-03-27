class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :creator
      t.string :group_name
      t.string :privacy
      t.timestamps
    end
  end
end
