class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.text :abilities
      t.integer :registered_user_id

      t.timestamps
    end
  end
end
