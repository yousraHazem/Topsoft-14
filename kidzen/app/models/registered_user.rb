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
    after_create :cap_names
    has_many :notifications, foreign_key: 'assigned_to', primary_key: 'username'

    # Capitalize all the names
    # Authors: Ahmed H. Ismail
    def cap_names
      self[:first_name].capitalize if self[:first_name] != nil
      self[:middle_name].capitalize if self[:middle_name] != nil
      self[:last_name].capitalize if self[:last_name] != nil
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

    # Adds a notification that a child was created.
    # creates notification and saves to database.
    # child - child entity that was created.
    # returns true if successful otherwise false
    def notify_child_created(child)
      notification = Notification.new
      # Set attributes
      notification.mark_unread
      notification.title = "New child #{child.full_name}"
      notification.short_desc = "A new child needs approval."
      notification.long_desc = ""
      notification.embedded_view_url = nil
      # Create actions
      notification.add_child_creation_actions
      # Enqueue
      queue_notification( notification )
      notification.save
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
