class CreateContentProvider < ActiveRecord::Migration
  def change
    create_table :content_providers, primary_key: :registered_user_id, id: false do |t|
    	t.integer :registered_user_id
      t.timestamps
    end
  end
end
