# Represents ParentOf relationship
#Authors: Ahmed H. Ismail
class ParentChild < ActiveRecord::Base
    belongs_to :child, foreign_key: 'child_id'
    #FIXME: Uncomment when supervisor model is implemented
    #belongs_to :supervisor, foreign_key: 'parent_id'
end
