class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
    	t.string :name
    end
  end
end
