class ActivityAccount < ActiveRecord::Base
  # This model represents the relation between child and activity
  # Authors: Khaled I. Elhossiny
  belongs_to :child
  belongs_to :activity
end
