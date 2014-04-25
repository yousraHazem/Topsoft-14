class Message < ActiveRecord::Base


  validates_presence_of :subject, :body, :recepient 
  validates :subject, length: { minimum: 3, maximum: 35 }
  validates :body, length: { minimum: 3, maximum: 1000 }

  belongs_to :registered_user
end