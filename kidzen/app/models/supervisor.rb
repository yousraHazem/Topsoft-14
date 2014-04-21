# Supervisor model.
# Authors: Ahmed H. Ismail
class Supervisor < ActiveRecord::Base
  belongs_to :registered_user, dependent: :destroy
  has_many :children, through: :child_parent
  has_many :supervised_children, through: :child_supervisor, class_name: "Child"
  validates_associated :registered_user
  self.primary_key = 'registered_user_id'

  # Returns an array of children pending verification.
  # Gets them through the ChildParent relationship.
  # Authors: Ahmed H. Ismail
  def pending_children
    # Children who set this user as their guardian.
    children = Child.where(guardian_email: registered_user.email )
    # Only those that haven't been approved.
    children.select { | c | !c.approved? }
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
    actions = notification.add_child_creation_actions
    actions_saved = true
    actions.each do |action| 
      actions_saved &= action.save
    end
    # Enqueue
    registered_user.queue_notification( notification )
    if notification.save and actions_saved
      true
    else
      # Clean up 
      actions.each do |action| 
        action.destroy
      end
      notification.destroy
      false
    end
  end

  def notify_friend_request(child_1, child_2)
    notification = Notification.new
    # Set attributes
    notification.mark_unread
    notification.title = "Friend Request #{child_2.full_name}"
    notification.short_desc = ""
    notification.long_desc = "#{child_1.full_name} sent a friend request to #{child_2.full_name}"


  
  # Approves a child
  # Returns true if successfull
  # Returns false if this user can not approve
  # that child. (different guardian)
  # Authors: Ahmed H. Ismail
  def aprove_child(child)
    if child.guardian_email == email
      child.update_attributes(is_approved: true) # Returns true
    else
      false # Not the guardian of this child
  end

  # Rejects a child
  # Returns true if successfull
  # Returns false if this user is not
  # the guadian of that child.
  # Authors: Ahmed H. Ismail
  def reject_child(child)
    if child.guardian_email == email
      # FIXME: 
    else
      false # Not the guardian of this child
  end

end
