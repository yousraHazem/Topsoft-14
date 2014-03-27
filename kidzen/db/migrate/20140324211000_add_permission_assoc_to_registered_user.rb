class AddPermissionAssocToRegisteredUser < ActiveRecord::Migration
  def change
    add_column :registered_users, :permission_id, :integer
  end
end
