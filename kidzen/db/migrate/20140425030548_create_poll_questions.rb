class CreatePollQuestions < ActiveRecord::Migration
  def change
    create_table :poll_questions do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
