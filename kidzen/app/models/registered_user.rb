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
    validates :birth_date, presence: true
    validates :gender, presence: true
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
    uniqueness: true
    validated :banned, presence: true
    validates :password, length: { minimum: 6 }
    validates_associated :permission #Note: Don't use on both ends
    # Associations:
    has_one :permission, dependent: :destroy
    after_initialize  :cap_names
    after_create :cap_names
    has_many :notifications, foreign_key: 'assigned_to', primary_key: 'username'

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
      gender.lowercase == "female"
    end


    # Checks if male
    # Authors: Ahmed H. Ismail
    def male?
      gender.lowercase == "male"
    end

    # # Am I a child?
    # # Authors: Ahmed H. Ismail
    # def child?
    #   is_child
    # end

    # Assigns gender.
    # Column value is trie if female
    # gender - symbol one of {female, male}
    # Authors: Ahmed H. Ismail
    def gender=(value)
      if value == :female
          self[:gender] = true
      elsif value == :male
          self[:gender] = false
      end
    end
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

    # TODO: Implement
    # Authors: Ahmed H. Ismail
    def ban
    end



    # Queues a notification as pending for this user.
    # Namely adds the foreign key.
    # notification - notification to queue
    # Authors: Ahmed H. Ismail
    def queue_notification(notification)
        notification.assigned_to = username  
    end

    # Retrieves Pending notifications
    # Authors: Ahmed H. Ismail
    def pending_notifications
      Notification.where(assigned_to: username, pending: true )
    end

end
