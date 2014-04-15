class Friendship < ActiveRecord::Base
belongs_to :child
belongs_to :friend, :class_name => 'Child', :foreign_key =>'friend_id'
end
