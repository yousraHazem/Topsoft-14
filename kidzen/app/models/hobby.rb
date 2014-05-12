#Author: Ahmad H. Elhamshary.
class Hobby < ActiveRecord::Base

#Associations and validations.
has_and_belongs_to_many :children

end
