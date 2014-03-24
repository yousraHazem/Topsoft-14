class Permission < ActiveRecord::Base
    belongs_to :registered_user
    serialize :abilities, Hash
end
