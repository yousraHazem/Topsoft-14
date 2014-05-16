#Author: Ahmad H. Elhamshary
class Interest < ActiveRecord::Base

#Associations and validations.
has_and_belongs_to_many :children

end
