class Topic < ActiveRecord::Base
  # Authors: Khaled I. Elhossiny
  has_many :activities
end
