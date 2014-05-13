require 'spec_helper'
# Minimal tests, just for checking if the buttons exist.
# Authors: Ahmed H. Ismail.
feature "Parent share on social media" do 

  background do
    @user = create(:supervisor)

  end

  before do
    login(@user.registered_user.email, @user.registered_user.password)
    visit parent_profile_path unless current_path == parent_profile_path 
    
  end

  subject { page }  

  describe "Should be able to share via G+" do
    it { should have_selector(".g-plus") }
  end

  describe "Should be able to tweet about the site" do
    it { should have_selector(".twitter-share-button", text: 'Tweet') }
  end

  describe "Should be able to share on facebook" do
    it { should have_selector(".fb-like") }
  end

end