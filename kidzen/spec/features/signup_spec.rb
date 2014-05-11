require 'spec_helper'

feature "parent signup" do 

  scenario "Should be able to create a parent account" do
    visit parent_signup_path
    fill_in "First Name", with: "TestSuperFirst"
    fill_in "Middle Name", with: "TestSuperMiddle"
    fill_in "Last Name", with: "TestSuperFamily"
    fill_in "Username", with: "TestSuperUsername"
    select "Male", from: "Gender"
    fill_in "Email", with: "testsupermail@example.com"
    fill_in "Password", with: "foobar"
    fill_in "confirm password", with: "foobar"
    expect {click_button "Create!"}.to change(RegisteredUser, :count).by(1) &&
      change(Supervisor, :count).by(1)    
  end

  scenario "Should be able to create a child account" do 
    visit child_signup_path
    click_link "English"
    fill_in "First Name", with: "TestChildFirst"
    fill_in "Middle Name", with: "TestChildMiddle"
    fill_in "Last Name", with: "TestChildFamily"
    fill_in "Username", with: "TestChildUsername"
    select "Male", from: "Gender"
    fill_in "Email", with: "testchildmail@example.com"
    fill_in "Password", with: "foobar"
    fill_in "confirm password", with: "foobar"
    fill_in "Guardian email", with: "testsupermail@exmaple.com"
    expect {click_button "Create!"}.to change(RegisteredUser, :count).by(1) &&
      change(Child, :count).by(1)
  end

end
  