class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :new_survey_id
    end
  end
end
