class Comment < ActiveRecord::Base
# Here we tell our database that every comment should belongs to a post
  belongs_to :post
end
