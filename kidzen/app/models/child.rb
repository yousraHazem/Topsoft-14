class Child < ActiveRecord::Base
  # Associations and validations.
  has_one :registered_user, dependent: :destroy
  validates_associated :registered_user

  has_many :friends,
           :through => :friendships,
           :conditions => "status = 'accepted'"

  has_many :requested_friends,
           :through => :friendships,
           :source => :friend,
           :conditions => "status = 'requested'", 
           :order   => :created_at

  has_many :pending_friends,
           :through => :friendships,
           :source => :friend,
           :conditions => "status = 'pending'",
           :order => :created_at

  has_many :friendships,
           :foreign_key => 'child1_id',
           :dependent => :destroy

  # Checks if other is a friend of this child.
  # other - child
  # Authors: Ahmed H. Ismail
  def friend?(other)
    Friendship.exists? child_1_id: id, child_2_id: other.id or 
    Friendship.exists? child_1_id: other.id, child_2_id: id
  end

  # Adds an entry in the ParentChild relationship.
  # Authors: Ahmed H. Ismail
  def add_parent(parent)
    ChildParent.create(child_id: id, parent_id: parent.id)
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
  def add_interested_party(supervisor)
    ChildSupervisor.create(child_id: id, supervisor_id: supervisor.id)
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
    
end
