class CreateNotificationActions < ActiveRecord::Migration
  def change
    create_table :notification_actions do |t|
      t.string :name
      t.string :url
      t.boolean :async
      t.integer :notification_id
      t.timestamps
    end
    add_index(:notification_actions, :notification_id, unique:  false)
  end
end