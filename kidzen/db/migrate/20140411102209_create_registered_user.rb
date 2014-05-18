class CreateRegisteredUser < ActiveRecord::Migration
  def change
    create_table :registered_users do |t|
        t.string :username
        t.boolean :online
        t.boolean :gender
        t.timestamp :last_accessed
        t.string :first_name
        t.string :middle_name
        t.string :family_name
        t.date :birth_date
        t.string :email
        t.string :nickname
        t.string :password_digest
        t.boolean :banned
        t.integer :permission_id
        t.boolean :notification_by_email
        t.string :remember_token
        t.string :image
        t.timestamps
    end
    add_index :registered_users, :email, unique: true 
    add_index :registered_users, :username, unique: true
    add_index :registered_users, :remember_token
  end
end
    
