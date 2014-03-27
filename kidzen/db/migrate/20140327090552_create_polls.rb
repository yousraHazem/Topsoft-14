class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :poll_question
      t.string :poll_answers

      t.timestamps
    end
  end
end
