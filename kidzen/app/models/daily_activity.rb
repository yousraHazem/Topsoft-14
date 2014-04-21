#Authors: Khaled I. Elhossiny
class DailyActivity < ActiveRecord::Base
# Associations and validations.

has_and_belongs_to_many:children

end
