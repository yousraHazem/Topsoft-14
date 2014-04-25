class CreatePollAnswers < ActiveRecord::Migration
  def change
    create_table :poll_answers do |t|
      t.string :content
      t.integer :poll_question_id
      t.integer :counter

      t.timestamps
    end
  end
end
