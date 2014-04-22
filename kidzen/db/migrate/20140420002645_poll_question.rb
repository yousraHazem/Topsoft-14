class PollQuestion < ActiveRecord::Migration
  def change
    create_table :poll_questions do |t|
      t.string :content
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end      
  end
end
