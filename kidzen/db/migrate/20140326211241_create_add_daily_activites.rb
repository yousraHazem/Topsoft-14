class CreateAddDailyActivites < ActiveRecord::Migration
  def change
    create_table :add_daily_activites do |t|
      t.integer :child_id
      t.string :activity

      t.timestamps
    end
  end
end
