# Module to help with sign in / up pages.
# Authors: Ahmed H. Ismail
module AuthenticationHelper 

  # Logs in a user
  # email - email to login with.
  # password - password to login with.
  # Authors: Ahmed H. Ismail.
  def login(email, password)
    visit signin_path
    click_link "English"
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Login!"
  end

end
