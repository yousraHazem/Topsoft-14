class ParentChildIndex < ActiveRecord::Migration
  def change
    add_index(:parent_children, [:parent_id, :child_id], unique:  false)
  end
end
