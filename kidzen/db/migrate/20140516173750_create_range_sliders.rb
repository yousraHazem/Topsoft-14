class CreateRangeSliders < ActiveRecord::Migration
  def change
    create_table :range_sliders do |t|
      t.integer :max
      t.integer :min
      t.integer :value
      t.integer :result
      t.integer :question_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
