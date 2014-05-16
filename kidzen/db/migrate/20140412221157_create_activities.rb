class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :min_age
      t.integer :max_age
      t.string :name
      t.string :topic
      t.timestamps
    end
  end
end
