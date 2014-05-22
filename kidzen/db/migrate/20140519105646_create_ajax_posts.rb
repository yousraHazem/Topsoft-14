class CreateAjaxPosts < ActiveRecord::Migration
  def change
    create_table :ajax_posts do |t|
    	t.string :status
    	t.integer :user_id
    end
  end
end
