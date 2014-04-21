class CreatePermission < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
        t.text :abilities
        t.belongs_to :registered_user
        t.timestamps
    end
  end
end
