class RenameUserNickColumn < ActiveRecord::Migration
  def change
    rename_column :registered_users, :nick_name, :nickname
  end
end
