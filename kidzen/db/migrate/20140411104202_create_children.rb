class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
        t.boolean :is_approved
        t.integer :registered_user_id
        t.string :guardian_email
        t.timestamps
    end
  end
end
