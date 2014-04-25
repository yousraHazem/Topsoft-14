    class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
        t.string :sender
        t.string :recepient
        t.string :subject
        t.text :body
        t.integer :read
    	  t.timestamps
    end
  end
end
