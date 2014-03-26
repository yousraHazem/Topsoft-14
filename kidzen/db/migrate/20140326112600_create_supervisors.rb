class CreateSupervisors < ActiveRecord::Migration
  def change
    create_table :supervisors do |t|
      t.integer :registered_user_id

      t.timestamps
    end
  end
end
