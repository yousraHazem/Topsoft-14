class CreateRegisteredUser < ActiveRecord::Migration
  def change
    create_table :registered_users do |t|
      t.string :username
      t.string :gender
      t.timestamp :last_accessed
      t.string :first_name
      t.string :middle_name
      t.string :family_name
      t.date :birth_date
      t.boolean :banned
      t.timestamps
      t.string :email
      t.string :password_digest
      t.string :remember_token
    end
    add_index :registered_users, :email, unique: true
    add_index :registered_users, :remember_token
  end

end
    
