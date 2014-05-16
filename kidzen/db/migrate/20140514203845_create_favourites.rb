class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
    	t.string :name  	
    end
  end
end
