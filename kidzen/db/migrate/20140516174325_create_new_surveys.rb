class CreateNewSurveys < ActiveRecord::Migration
  def change
    create_table :new_surveys do |t|
      t.string :name
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :new_survey_id
    end
  end
end
