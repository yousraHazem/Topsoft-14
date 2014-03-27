class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.time :sent_in_time
      t.date :sent_in_date
      t.string :type
      t.boolean :checked

      t.timestamps
    end
  end
end
