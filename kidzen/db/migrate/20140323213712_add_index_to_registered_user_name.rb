class AddIndexToRegistereduser_name < ActiveRecord::Migration
  def change
    add_index :registered_users, :user_name, unique: true
  end
end
