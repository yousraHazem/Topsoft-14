class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
<<<<<<< HEAD
      t.string :location
	  t.string :name
	  t.date :date
	  t.string :description
	  t.timestamps
    end
  end
=======
	  t.string :location
	  t.string :name
	  t.datetime :date_time
	  t.string :description
	  t.timestamps
		  end
	end
>>>>>>> 6db4272704ecfdba05e4b9a5a28c5a1f11699b5d
end
