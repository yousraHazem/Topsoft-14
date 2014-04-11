class CreateSupervisorChildren < ActiveRecord::Migration
  def change
    create_table :supervisor_children do |t|
      t.integer :supervisor_id
      t.integer :child_id
      t.timestamps
    end
  end
end
