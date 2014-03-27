class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :survey_question
      t.string :survey_answers

      t.timestamps
    end
  end
end
