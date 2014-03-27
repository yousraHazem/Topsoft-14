# Represents ParentOf relationship
#Authors: Ahmed H. Ismail
class ParentChild < ActiveRecord::Base
  belongs_to :child, foreign_key: 'child_id'
  belongs_to :supervisor, foreign_key: 'parent_id'
end
