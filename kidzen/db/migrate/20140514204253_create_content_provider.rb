class CreateContentProvider < ActiveRecord::Migration
  def change
    create_table :content_providers do |t|
    	t.string :username
		t.string :email
		t.string :password_digest
		t.string :remember_token
    end
  end
end
