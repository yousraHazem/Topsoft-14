# The model representing 
# RegisteredUser.
# Authors: Ahmed H. Ismail
class RegisteredUser < ActiveRecord::Base
  private
    VALID_EMAIL_REGEX = /\A([a-z.\-_\d]+)@([a-z\-_\d]+(\.[a-z]+)+)\z/
  public
    # Validations: 
    validates :username, presence: true, length: { minimum: 4 }, uniqueness: true
    validates :first_name, presence: true, length: { maximum: 256 }
    validates :middle_name, presence: true, length: { maximum: 256 }
    validates :family_name, presence: true, length: { maximum: 256 }
    validates :nickname, presence: true, length: { minimum: 4, maximum: 512 }
    validates :password_digest, presence: true
    validates :birth_date, presence: true
    validates :banned, presence: true
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
    uniqueness: true
    validates :password, length: { minimum: 6 }
    validates_associated :permission #Note: Don't use on both ends
    # Associations:
    has_one :permission, dependent: :destroy
    has_secure_password
    after_initialize  :cap_names
    after_create :cap_default
     attr_accessible :email, :first_name, :last_name
  acts_as_messageable
 
  # Returns the name of the user
  def name
   return "#{first_name} #{last_name}"
  end
end
def mailboxer_email(object)
#Check if an email should be sent for that object
#if true
return "#{RegisteredUser.email}"
#if false
return nil
end

    # Capitalize all the names
      def cap_names
        self[:first_name].capitalize
        self[:middle_name].capitalize
        self[:last_name].capitalize
      end
      # Full name with space sperators
      # Authors: Ahmed H. Ismail
      def full_name
        [first_name, middle_name, family_name].join(" ")
      end
        
      def female?
        gender == true
      end

      def male?
        gender == false
      end

      def gender=(value)
        if value == :female
            self[:gender] = true
          elsif value == :male
              self[:gender] = false
          end
        end

      def first_name=(name)
        self[:first_name] = name.capitalize
      end

      def middle_name=(name)
        self[:middle_name] = name.capitalize
      end

      def family_name=(name)
        self[:family_name] = name.capitalize
      end

end
