class CreateChildSupervisor < ActiveRecord::Migration
  def change
    create_table :child_supervisors do |t|
      t.integer :supervisor_id
      t.integer :child_id
      t.timestamps
    end
  end
end
