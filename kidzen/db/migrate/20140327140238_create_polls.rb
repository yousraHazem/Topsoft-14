class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :question
      t.string :asnwer1
      t.string :answer2
      t.string :answer3

      t.timestamps
    end
  end
end
