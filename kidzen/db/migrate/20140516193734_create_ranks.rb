class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.string :content
      t.integer :question_id
      t.timestamps
    end
  end
end
