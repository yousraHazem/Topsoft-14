class CreatePicModels < ActiveRecord::Migration
  def change
    create_table :pic_models do |t|
      t.string :pic_url
      t.integer :question_id
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :votes
    end
  end
end
