class CreateChildParent < ActiveRecord::Migration
  def change
    create_table :child_parents do |t|
        t.integer :parent_id
        t.integer :child_id
        t.timestamps
    end
    add_index(:parent_children, [:parent_id, :child_id], unique:  true)
  end
end
