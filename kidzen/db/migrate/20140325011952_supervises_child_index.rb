class SupervisesChildIndex < ActiveRecord::Migration
  def change
        add_index(:supervises_children, [:supervisor_id, :child_id], unique:  false)
  end
end
