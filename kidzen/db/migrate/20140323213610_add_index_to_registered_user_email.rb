class AddIndexToRegisteredUseremail < ActiveRecord::Migration
  def change
    add_index :registered_users, :email, unique: true 
  end
end
