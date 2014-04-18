class Supervisor < ActiveRecord::Base
    has_one :registered_user, dependent: :destroy
    validates_associated :registered_user
    self.primary_key = 'registered_user_id'
end
