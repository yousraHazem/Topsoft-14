class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :assigned_to
      t.string :title
      t.string :short_desc
      t.string :long_desc
      t.string :embedded_view_url
      t.boolean :pending
      t.string :data
      t.timestamps
    end
    add_index(:notifications, :assigned_to, unique:  false)
  end
end
