class Post < ActiveRecord::Base
# Here we ensure that every post's body will not be empty
# also saying that every post has many comments
  validates_presence_of :body
  has_many :comments
  has_one :photo
end
