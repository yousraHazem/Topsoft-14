# Helpers for logging in
# Authors: Ahmed H. Ismail
module SessionsHelper

  # Signs in a user and stores a cookie on his/her browser.
  # Only call this from sessions controller
  # Or after authenticating the password !
  # Authors: Ahmed H. Ismail
  def sign_in(user)
    # Create new token.
    remember_token = RegisteredUser.new_remember_token
    # Place token (plain text) in browser
    cookies.permanent[:remember_token] = remember_token
    # Save hashed token in browser
    user.update_attribute(:remember_token, RegisteredUser.digest(remember_token))
    self.current_user = user
  end

  # Signs out the currently logged in user.
  # Authors: Ahmed H. Ismail
  def sign_out
      current_user.update_attribute(:remember_token,
                                    RegisteredUser.digest(RegisteredUser.new_remember_token))
      cookies.delete(:remember_token)
      self.current_user = nil
  end

  # Sets current user
  # Authors: Ahmed H. Ismail
  def current_user=(user)
    @current_user = user
  end

  # Retrive currently signed in user
  # Authors: Ahmed H. Ismail
  def current_user
    remember_token = RegisteredUser.digest(cookies[:remember_token])
    @current_user ||= RegisteredUser.find_by(remember_token: remember_token)
  end

  # Is someone signed in ?
  # Authors: Ahmed H. Ismail
  def signed_in?
      !current_user.nil?
  end

end
