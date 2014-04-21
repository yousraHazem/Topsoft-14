class Friendship < ActiveRecord::Base
# Associations
belongs_to :child, :class_name => 'User', :foreign_key =>'child1_id'
belongs_to :friend, :class_name => 'User', :foreign_key =>'child2_id'
end
