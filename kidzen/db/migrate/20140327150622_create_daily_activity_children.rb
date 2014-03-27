class CreateDailyActivityChildren < ActiveRecord::Migration
  def change
    create_table :daily_activity_children do |t|

      t.timestamps
    end
  end
end
