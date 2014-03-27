class CreateRegisteredUsers < ActiveRecord::Migration
  def change
    create_table :registered_users do |t|

      t.timestamps
    end
  end
end
