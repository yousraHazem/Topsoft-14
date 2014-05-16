require "spec_helper"

feature "Video uploading" do
  scenario "User uploads new video" do
    visit "/videos/new" 
    fill_in "description", :with => "Test Description"
    fill_in "youtube", 
      :with => "https://www.youtube.com/watch?v=fSJruNAS3BY"
    click_button "Create Video"

    expect(page).to have_text("Successfully created video")
  end
end
