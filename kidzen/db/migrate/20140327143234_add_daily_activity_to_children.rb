class AddDailyActivityToChildren < ActiveRecord::Migration
  def change
    add_column :children, :daily_activity, :integer
  end
end
