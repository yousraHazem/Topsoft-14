class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.string :title
    	t.string :sender_username
    	t.string :receiver_username
    	t.string :content
    	t.date :sent_in_date
    	t.time :sent_in_time

    	t.timestamps
    end
  end
end
