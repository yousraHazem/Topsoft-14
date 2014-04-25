class CreateChildInterests < ActiveRecord::Migration
  def change
    create_table :child_interests do |t|
    	t.string :child_name
		t.string :interest_name
    end
  end
end
