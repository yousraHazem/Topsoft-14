class CreateChildFavourites < ActiveRecord::Migration
  def change
    create_table :child_favourites do |t|
    	t.string :child_name
		t.string :favourite_name
    end
  end
end
