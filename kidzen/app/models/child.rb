# The model representing 
# Children.
# Authors: Ahmed H. Ismail
class Child < ActiveRecord::Base
    has_one :registered_user, dependent: :destroy
    validates_associated :registered_user

    def friend?(other)
        FriendShip.exists? child_1_id: id, child_2_id: other.id or 
        FriendShip.exists? child_1_id: other.id, child_2_id: id
    end

    def add_parent(parent)
        ParentChild.create(child_id: id, parent_id: id)
    end

    def join(chat_room)
    end

    def invite(chat_room, inviter)
    end

    def receive_friend_request(requester)
    end

    def send_friend_request(friend)
    end

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
    def delete_message(message)
    end
    
    
end
