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
      t.string :nickname
      t.boolean :banned, null: false, default: false
      t.integer :permission_id
      t.timestamps
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps
    end

    add_index :registered_users, :email,                unique: true
    add_index :registered_users, :reset_password_token, unique: true
    # add_index :registered_users, :confirmation_token,   unique: true
    # add_index :registered_users, :unlock_token,         unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
    
