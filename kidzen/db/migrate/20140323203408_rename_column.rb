class RenameColumn < ActiveRecord::Migration
    def change
        rename_column :registered_users, :username, :user_name
    end
end
