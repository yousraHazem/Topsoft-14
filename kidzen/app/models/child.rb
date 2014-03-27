# The model representing 
# Children.
# Authors: Ahmed H. Ismail
class Child < ActiveRecord::Base
  # Associations and validations.
  has_one :registered_user, dependent: :destroy
  validates_associated :registered_user

  def friend?(other)
    FriendShip.exists? child_1_id: id, child_2_id: other.id or 
    FriendShip.exists? child_1_id: other.id, child_2_id: id
  end

  # Adds an entry in the ParentChild relationship.
  # Authors: Ahmed H. Ismail
  def add_parent(parent)
    ParentChild.create(child_id: id, parent_id: parent.id)
  end

  def join(chat_room)
  end

  def invite(chat_room, inviter)
  end

  def receive_friend_request(requester)
  end

  def send_friend_request(friend)
  end

  # Adds an entry in the SupervisesChild relationship.
  # Authors: Ahmed H. Ismail
  def add_interested_part(supervisor)
    SupervisesChild.create(child_id: id, supervisor_id: supervisor.id)
  end

  def notify_observers
  end

  def notifications
  end

  def write_message
  end

  # FIXME: This should be in Message
  # ERD??
  def delete_message(message)
  end
    
  # Returns true if supervisor is a supervisor of child  
  # Authors: Ahmed H. Ismail
  def can_see_progress_as_supervisor?(supervisor)
    entries = SupervisesChild.where(child_id: id, supervisor_id: supervisor.id)
    return not entries.empty?
  end    

  # Returns true if supervisor is a ****parent ****
  # of this child
  def can_see_progress_as_parent?(parent)
    entries = ParentChild.where(child_id: id, parent_id: parent.id)
    return not entries.empty?
  end 
  

end
