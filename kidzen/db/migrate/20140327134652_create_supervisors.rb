class CreateSupervisors < ActiveRecord::Migration
  def change
    create_table :supervisors do |t|
      t.string :personal_id
      t.string :phone_num
      t.string :address

      t.timestamps
    end
  end
end
