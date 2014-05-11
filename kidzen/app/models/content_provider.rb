class ContentProvider < ActiveRecord::Base
  include TokenHelper

  # Creates the token.
  # Authors: Ahmed H. Ismail , Nouran Tarek Attia
    def create_remember_token
      self.remember_token = digest(new_remember_token)
    end

    before_create :create_remember_token

end
