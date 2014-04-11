class CreateSupervisors < ActiveRecord::Migration
  def change
    create_table :supervisors, :primary_key => :registered_user_id, :id => false do |t|
      t.integer :registered_user_id
      t.timestamps
    end
    add_index :supervisors, :registered_user_id, unique: true 
  end
end
