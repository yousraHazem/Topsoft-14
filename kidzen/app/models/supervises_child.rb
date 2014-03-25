#Supervisor Child relationship model.
#Authors: Ahmed H. Ismail
class SupervisesChild < ActiveRecord::Base
    belongs_to :child, foreign_key: 'child_id'
    # TODO: Uncomment when supervisor model is implemented
    #belongs_to :supervisor, foreign_key: 'supervisor_id'
end
