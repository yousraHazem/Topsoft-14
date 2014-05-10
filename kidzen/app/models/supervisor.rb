# Supervisor model.
# Authors: Ahmed H. Ismail
class Supervisor < ActiveRecord::Base
  belongs_to :registered_user, dependent: :destroy
  has_many :children, through: :child_parent
  has_many :supervised_children, through: :child_supervisor, class_name: "Child"
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
  # Authors: Ahmed H. Ismail
  def notify_child_created(child)
    notification = Notification.new
    # Set attributes
    notification.pending = true
    notification.title = "A new child needs approval."
    notification.short_desc = "New child #{child.registered_user.full_name}"
    notification.long_desc = " "
    notification.custom_view_url = nil
    # Enqueue
    registered_user.queue_notification( notification ) # Sets the associations
    if notification.save
      actions = notification.add_child_creation_actions(child)
      actions_saved = true
      actions.each { |action| actions_saved &= action.save }
      if actions_saved
        # Everything is okay.
        return true
      else
        # Failed to save notification actions
        notification.destroy
        return false
      end
    else 
      # Failed to save notification
      return false
    end
  end

  # This method create a notification
  # , make it unread and fill it's attributes 
  # chils_1 - is the child sending the friend request
  # child_2 - is the child that the friend request is sent to
  # it returns true if it is successfully saved and false otherwise
  # Authors: Shary Beshara
  def notify_friend_request(child_1, child_2)
    notification = Notification.new
    notification.mark_unread
    notification.title = "Friend Request #{child_2.full_name}"
    notification.short_desc = ""
    notification.long_desc = "#{child_1.full_name} sent a friend request to #{child_2.full_name}"
    notification.save
  end


  # Adds a notification that a post 
  # of a supervised child was reported.
  # post - post that was reported, read only
  # returns true if sucessful otherwise false
  # Authors: Ahmed H. Ismail
  def notify_post_reported(post)
    child = Child.find(post.poster)
    if parent_or_supervisor_of?(child)
      notification = Notification.new
      notification.title = "Reported post by #{child.registered_user.full_name}"
      notification.short_desc = "#{post.title}"
      notification.long_desc = " "
      noticiation.custom_view_url = "post_notification"
      registered_user.queue_notification(noticiation)
      if notification.save?
        actions = notification.add_post_reported_actions(post)
        actions_saved = true
        actions.each { |action| actions_saved &= action.save }
        if actions_saved
          # Everything is ok
          true
        else
          # Failed to save actions
          notification.destroy
          false
        end
      else
        # Failed to save notification 
        false
      end
    else
      # Shouldn't receive notification
      false
    end
  end

  # Checks if this user is the supervisor
  # or parent of child.
  # child - child in question
  # Authors: Ahmed H. Ismail
  def parent_or_supervisor_of?(child)
    children.include?(child) or supervised_children.include?(child) 
  end

  
  # Approves a child
  # child - child to accept modified and saved in database
  # Returns true if successfull
  # Returns false if this user can not approve
  # that child. (different guardian)
  # Authors: Ahmed H. Ismail
  def accept_child(child)
    if child.guardian_email == registered_user.email
      child.update_attributes(is_approved: true) # Returns true
    else
      false # Not the guardian of this child
    end
  end

  # Rejects a child
  # child - child to reject modified and saved in database
  # Returns true if successfull
  # Returns false if this user is not
  # the guadian of that child.
  # Authors: Ahmed H. Ismail
  def reject_child(child)    
    if child.guardian_email == registered_user.email
      # FIXME: Should child be banned?
      true 
    else
      false # Not the guardian of this child
    end
  end

end
