class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :question
      t.string :asnwer1

      t.timestamps
    end
  end
end
