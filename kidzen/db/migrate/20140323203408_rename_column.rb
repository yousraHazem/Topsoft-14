class RenameColumn < ActiveRecord::Migration
    def change
        rename_column :registered_users, :user_name, :user_name
    end
end
