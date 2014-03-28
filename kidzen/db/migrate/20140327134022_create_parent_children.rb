class CreateParentChildren < ActiveRecord::Migration
  def change
    create_table :parent_children do |t|
      t.string :parent_name
      t.string :child_name

      t.timestamps
    end
  end
end
