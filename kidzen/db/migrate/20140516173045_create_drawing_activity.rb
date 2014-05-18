class CreateDrawingActivity < ActiveRecord::Migration
  def change
    create_table :drawing_activities do |t|
      t.string :drawing_content
      t.belongs_to :activity
      t.timestamps
    end
  end
end
