class CreateHobbies < ActiveRecord::Migration
  def change
    create_table :hobbies do |t|
    	t.string :name
    	t.integed :id    	
    end
  end
end
