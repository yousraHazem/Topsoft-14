class CreateRegisteredUser < ActiveRecord::Migration
  def change
    create_table :registered_users do |t|
      t.string :username
      t.boolean :is_child
      t.boolean :online
      t.string :gender
      t.timestamp :last_accessed
      t.string :first_name
      t.string :middle_name
      t.string :family_name
      t.date :birth_date
      t.boolean :banned
      t.timestamps
      t.string :email
    end

    add_index :registered_users, :email,                unique: true
    add_index :registered_users, :reset_password_token, unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
    
