class Supervisor < ActiveRecord::Base
  has_one :registered_user
end
