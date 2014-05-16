class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
    	t.string :name
    	t.integed :id    	
    end
  end
end
