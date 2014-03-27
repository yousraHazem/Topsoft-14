class RegisteredUserAddColumnBanned < ActiveRecord::Migration
  def change
    add_column :registered_users, :banned, :boolean
  end
end
