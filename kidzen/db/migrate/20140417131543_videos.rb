class Videos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :description
      t.string :category
      t.integer :length
      t.timestamps
    end
  end
end
