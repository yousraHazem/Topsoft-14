<<<<<<< HEAD
class ParentChild < ActiveRecord::Base
=======
# Represents ParentOf relationship
#Authors: Ahmed H. Ismail
class ParentChild < ActiveRecord::Base
  belongs_to :child, foreign_key: 'child_id'
  belongs_to :supervisor, foreign_key: 'parent_id'
>>>>>>> 6220626cf07ed4ce26538d770a38dc9e0b17a97e
end
