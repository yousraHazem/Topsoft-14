class AddGenderToRegisteredUsers < ActiveRecord::Migration
  def change
    add_column :registered_users, :gender, :boolean
  end
end
