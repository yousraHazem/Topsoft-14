class CreateChildHobbies < ActiveRecord::Migration
  def change
    create_table :child_hobbies do |t|
      t.string :child_name
	  t.string :hobby_name
    end
  end
end
