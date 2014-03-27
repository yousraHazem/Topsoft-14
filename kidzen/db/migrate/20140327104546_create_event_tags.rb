class CreateEventTags < ActiveRecord::Migration
  def change
    create_table :event_tags do |t|
      t.string :tag
      t.integer :event_id

      t.timestamps
    end
  end
end
