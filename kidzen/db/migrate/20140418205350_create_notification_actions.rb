class CreateNotificationActions < ActiveRecord::Migration
  def change
    create_table :notification_actions do |t|
      t.string :name
      t.string :url
      t.string :data
      t.boolean :async
      t.belongs_to :notification
      t.timestamps
    end
    add_index(:notification_actions, :notification_id, unique:  false)
  end
end