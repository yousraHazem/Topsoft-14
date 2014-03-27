class CreateParentChildren < ActiveRecord::Migration
  def change
    create_table :parent_children do |t|
      t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
  end
end
