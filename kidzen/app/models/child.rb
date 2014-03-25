# The model representing 
# Children.
# Authors: Ahmed H. Ismail
class Child < ActiveRecord::Base
    has_one :registered_user, dependent: :destroy
    validates_associated :registered_user
end
