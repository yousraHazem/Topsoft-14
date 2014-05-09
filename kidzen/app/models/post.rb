class Post < ActiveRecord::Base
  validates_presence_of :body
  has_many :comments
end
