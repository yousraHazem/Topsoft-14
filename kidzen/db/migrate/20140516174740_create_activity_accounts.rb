class CreateActivityAccounts < ActiveRecord::Migration
  def change
    create_table :activity_accounts do |t|
      t.integer :child_id
      t.integer :activity_id
      t.integer :level
      t.integer :score
    end
  end
end
