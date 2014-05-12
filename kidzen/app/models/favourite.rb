#Author: Ahamd H. Elhamshary
class Favourite < ActiveRecord::Base

#Associations and validations.
has_and_belongs_to_many :children

end
