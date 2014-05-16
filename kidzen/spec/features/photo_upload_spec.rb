require "spec_helper"

feature "Photo uploading" do
  scenario "User uploads new photo" do
    visit "/photos/new" puts page.body
    fill_in "Description", :with => "Test Description"
    fill_in "rem", 
      :with => "http://images4.fanpop.com/image/photos/18500000"\
        "/Beautiful-Color-roses-18577527-500-375.jpg"
    click_button "Create Photo"

    expect(page).to have_text("Successfully created photo.")
  end
end
