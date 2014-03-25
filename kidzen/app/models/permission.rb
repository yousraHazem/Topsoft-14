# The model representing 
# Permissions
# abilities is a key,bool hash
# Authors: Ahmed H. Ismail
class Permission < ActiveRecord::Base
    belongs_to :registered_user
    serialize :abilities, Hash
end
