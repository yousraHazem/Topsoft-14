class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.integer :question_id
      t.integer :counter
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :votes
    end
  end
end
