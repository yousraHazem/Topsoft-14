class CreateChildHobbies < ActiveRecord::Migration
  def change
    create_table :child_hobbies do |t|
      t.string :username
      t.string :String
      t.string :name
      t.string :String

      t.timestamps
    end
  end
end
