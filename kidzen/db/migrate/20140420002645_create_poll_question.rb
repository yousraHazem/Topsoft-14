class CreatePollQuestion < ActiveRecord::Migration
  def change
    create_table :poll_questions do |t|
      t.string :content
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :user_id
      t.timestamps
    end      
  end
end
