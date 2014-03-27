# The model representing 
# The adding of daily activity
# to children
# Authors: Khaled I.Elhossiny
class DailyActivityChild < ActiveRecord::Base
    belongs_to :daily_activity, foreign_key: 'activity_id'
    belongs_to :child, foreign_key: 'child_id'
    belongs_to :registered_user, foreign_key: 'adder_id'
    validates :adder_id, presence: true
    validates :child_id, presence: true
    validates :registered_user, presence: true
end
