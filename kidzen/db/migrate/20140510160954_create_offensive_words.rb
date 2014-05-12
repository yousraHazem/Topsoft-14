class CreateOffensiveWords < ActiveRecord::Migration
  def change
    create_table :offensive_words do |t|
    	t.string :offensive_words
    end
  end
end
