class CreateSignUps < ActiveRecord::Migration
  def change
    create_table :sign_ups do |t|
      t.string :Username
      t.string :Password
      t.datetime :Date_Of_Birth
      t.string :Gaurdian_Email
      t.string :Email

      t.timestamps
    end
  end
end
