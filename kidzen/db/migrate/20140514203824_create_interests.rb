class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
    	t.string :name
    	t.integed :id
    end
  end
end
