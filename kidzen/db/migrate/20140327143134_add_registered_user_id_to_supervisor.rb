class AddRegisteredUserIdToSupervisor < ActiveRecord::Migration
  def change
    add_column :supervisors, :registered_user_id, :integer
  end
end
