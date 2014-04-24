class Friendship < ActiveRecord::Base
# Associations
belongs_to :child, :class_name => 'Child', :foreign_key =>'child_1_id'
belongs_to :friend, :class_name => 'Child', :foreign_key =>'child_2_id'
end
