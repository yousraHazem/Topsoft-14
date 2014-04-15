class AddDetailsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :location, :string
    add_column :events, :name, :string
    add_column :events, :date_time, :datetime
    add_column :events, :description, :string
  end
end
