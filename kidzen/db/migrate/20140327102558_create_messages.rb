class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.String :title
      t.RegisteredUser :sender
      t.RegisteredUser :receiver
      t.String :content
      t.Time :sentInTime
      t.DateTime :sentInDate

      t.timestamps
    end
  end
end
