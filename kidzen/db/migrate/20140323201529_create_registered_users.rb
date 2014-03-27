class CreateRegisteredUsers < ActiveRecord::Migration
  def change
    create_table :registered_users do |t|
      t.string :username
      t.boolean :online
      t.timestamp :last_accessed
      t.string :first_name
      t.string :middle_name
      t.string :family_name
      t.date :birth_date
      t.string :email
      t.string :nick_name
      t.string :password_digest

      t.timestamps
    end
  end
end
