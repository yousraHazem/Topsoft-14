# Supervisor model.
# Authors: Ahmed H. Ismail
class Supervisor < ActiveRecord::Base
    has_one :registered_user, dependent: :destroy
    has_many :children, through: :child_parent
    has_many :supervised_children, through: :child_supervisor, class_name: "Child"
    validates_associated :registered_user
    self.primary_key = 'registered_user_id'

    # Returns an array of children pending verification.
    # Gets them through the ChildParent relationship.
    # Authors: Ahmed H. Ismail
    def pending_children
      children.select { | c | !c.approved? }
    end
end
