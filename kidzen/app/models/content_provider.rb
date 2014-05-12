class ContentProvider < ActiveRecord::Base
  include TokenHelper

  private
    VALID_EMAIL_REGEX = /\A([a-z.\-_\d]+)@([a-z\-_\d]+(\.[a-z]+)+)\z/

  # Creates the token.
  # Authors: Ahmed H. Ismail , Nouran Tarek Attia
    def create_remember_token
      self.remember_token = ContentProvider.digest(ContentProvider.new_remember_token)
    end

  public
    #Validations for content provider
    before_create :create_remember_token
    validates :username, presence: true, length: { minimum: 4 },
      uniqueness: true
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
      uniqueness: true


end
