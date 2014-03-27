class CreateDailyActivities < ActiveRecord::Migration
  def change
    create_table :daily_activities do |t|
      t.string :name
      t.string :info
      t.integer :value

      t.timestamps
    end
  end
end
