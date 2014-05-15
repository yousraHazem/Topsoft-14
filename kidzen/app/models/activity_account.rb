class ActivityAccount < ActiveRecord::Base
belongs_to :child
belongs_to :activity
end
