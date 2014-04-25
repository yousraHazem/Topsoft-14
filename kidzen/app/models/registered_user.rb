# The model representing 
# RegisteredUser.
# Authors: Ahmed H. Ismail
class RegisteredUser < ActiveRecord::Base
  searchkick autocomplete: [:username, :first_name, :middle_name, :family_name, :nickname, :email]  
  private
    VALID_EMAIL_REGEX = /\A([a-z.\-_\d]+)@([a-z\-_\d]+(\.[a-z]+)+)\z/

    # Creates the token.
    # Authors: Ahmed H. Ismail
    def create_remember_token
      self.remember_token = RegisteredUser.digest(RegisteredUser.new_remember_token)
    end

  public
    # Validations: 
    validates :username, presence: true, length: { minimum: 4 }, uniqueness: true
    validates :first_name, presence: true, length: { maximum: 256 }
    validates :middle_name, presence: true, length: { maximum: 256 }
    validates :family_name, presence: true, length: { maximum: 256 }
    validates :birth_date, presence: true
    validates :gender, presence: true
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
    uniqueness: true
    validates :banned, inclusion: [true, false]
    # this needs to be in the javascript
    # validates :password, length: { minimum: 6 }
    validates_associated :permission # Note: Don't use on both ends
    # Associations:
    has_one :permission, dependent: :destroy
    after_initialize  :cap_names
    after_create :cap_names
    before_create :create_remember_token
    has_many :notifications, foreign_key: 'assigned_to', primary_key: 'username'
    has_secure_password

    # Capitalize all the names
    # Authors: Ahmed H. Ismail
    def cap_names
      self[:first_name].capitalize if self[:first_name] != nil
      self[:middle_name].capitalize if self[:middle_name] != nil
      self[:family_name].capitalize if self[:family_name] != nil
    end
    
    # Full name with space sperators
    # Authors: Ahmed H. Ismail
    def full_name
      [first_name, middle_name, family_name].join(" ")
    end
    
    # Checks if female
    # Authors: Ahmed H. Ismail    
    def female?
      gender.downcase == "female"
    end


    # Checks if male
    # Authors: Ahmed H. Ismail
    def male?
      gender.downcase == "male"
    end

    # # Am I a child?
    # # Authors: Ahmed H. Ismail
    # def child?
    #   is_child
    # end


    # Assigns first name.
    # name - string input
    # Authors: Ahmed H. Ismail
    def first_name=(name)
      self[:first_name] = name.capitalize
    end

    # Assigns middle name.
    # name - string input
    # Authors: Ahmed H. Ismail
    def middle_name=(name)
      self[:middle_name] = name.capitalize
    end

    # Assigns first name.
    # name - string input
    # Authors: Ahmed H. Ismail
    def family_name=(name)
      self[:family_name] = name.capitalize
    end

    # TODO: Missing other actions
    # Such as preventing from logging in
    # Authors: Ahmed H. Ismail
    def ban
        self[:banned] = true
    end

    # TODO: Missing other actions
    # Such as re-allowing logging in
    # Authors: Ahmed H. Ismail
    def unban
        self[:banned] = false
    end

    # Queues a notification as pending for this user.
    # Namely adds the foreign key.
    # notification - notification to queue
    # notification_by_email - is the boolean that shows if the user wants the 
    # notification to be sent by email
    # notification_by_email - is the method in usermailer that sends the email 
    # Authors: Ahmed H. Ismail, Shary Beshara
    def queue_notification(notification)
        notification.assigned_to = username 
        notification.registered_user = self  
        if self.notification_by_email
            UserMailer.notification_by_email(email, notification).deliver 
        end
    end

    # Retrieves Pending notifications
    # Authors: Ahmed H. Ismail
    def pending_notifications
      Notification.where(assigned_to: username, pending: true )
    end



    # Generates a random token
    # Authors: Ahmed H. Ismail
    def self.new_remember_token
       SecureRandom.urlsafe_base64
    end

    # Passes token through one way hash
    # Authors: Ahmed H. Ismail
    def self.digest(token)
      Digest::SHA1.hexdigest(token.to_s)
    end

    # this method changes the attribute (notification_by_email) of the user by # the value passed to it from the controller
    # notification_by_email is the attribute that show if the user wants the 
    # notifications to be sent by email
    # Authors: Shary Beshara
    def settings(notification_by_email)
        update_attributes(notification_by_email: notification_by_email)
    end



end
