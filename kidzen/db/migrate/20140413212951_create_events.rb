class CreateEvents < ActiveRecord::Migration
	def change
		  create_table :events do |t|
			    t.string :location
			    t.string :name
			    t.datetime :date_time
			    t.string :description
			    t.string :image
			    t.timestamps
		  end
	end
end
