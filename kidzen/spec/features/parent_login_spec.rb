require 'spec_helper'
# Tests for logging in.
feature "Authentication" do

  background do 
    @supervisor = create(:supervisor) 
    login(@supervisor.registered_user.email, @supervisor.registered_user.password)
    @supervisor.reload   
  end
  subject { @supervisor }
  scenario '#login' do
    subject.registered_user.online.should eq true
  end

  scenario '#logout' do
    visit signout_path
    subject.registered_user.online.should eq false
  end
end