# The model representing 
# RegisteredUser
# Authors: Ahmed H. Ismail
class RegisteredUser < ActiveRecord::Base
    private
        VALID_EMAIL_REGEX = /\A([a-z.\-_\d]+)@([a-z\-_\d]+(\.[a-z]+)+)\z/
    public
        validates :user_name, presence: true, length: { minimum: 4 }, uniqueness: true
        validates :first_name, presence: true, length: { maximum: 256 }
        validates :middle_name, presence: true, length: { maximum: 256 }
        validates :family_name, presence: true, length: { maximum: 256 }
        validates :nickname, presence: true, length: { minimum: 4, maximum: 512 }
        validates :password_digest, presence: true
        validates :birth_date, presence: true
        validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
        has_one :permission, dependent: :destroy
        validates_associated :permission #Note: Don't use on both ends
        has_secure_password
        validates :password, length: { minimum: 6 }
end
