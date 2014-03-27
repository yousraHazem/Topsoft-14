class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.boolean :approved
      t.string :guardian_email
      t.string :user_name
      t.string :password
      t.string :first_name
      t.datetime :birth_of_date
      t.string :gender

      t.timestamps
    end
  end
end
