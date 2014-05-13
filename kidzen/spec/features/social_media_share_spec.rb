require 'spec_helper'
# Minimal tests, just for checking if the buttons exist.
# Authors: Ahmed H. Ismail.
feature "Parent share on social media" do 

  background do
    @user = create(:supervisor)
    login(@user.registered_user.email, @user.registered_user.password)
    visit parent_profile_path unless current_path == parent_profile_path 
  end

  subject { page }  
    
  scenario { should have_selector(".g-plus") }
  scenario { should have_selector(".twitter-share-button", text: 'Tweet') }
  scenario { should have_selector(".fb-like") } 

end