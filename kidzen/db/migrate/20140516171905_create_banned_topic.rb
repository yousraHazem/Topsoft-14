class CreateBannedTopic < ActiveRecord::Migration
  def change
    create_table :banned_topics do |t|
      t.string :child_name
      t.string :activity_topic
      t.timestamps
    end
  end
end
