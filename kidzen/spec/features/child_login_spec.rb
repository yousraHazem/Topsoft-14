require 'spec_helper'
# Tests for logging in.
feature "Authentication" do

  background do 
    @child = create(:child) 
    login(@child.registered_user.email, @child.registered_user.password)
    @child.reload   
  end
  subject { @child }
  scenario '#login' do
    subject.registered_user.online.should eq true
  end

  scenario '#logout' do
    visit signout_path
    subject.registered_user.online.should eq false
  end
end