# ContentProvider model.
# Authors: Ahmed H. Ismail, Nouran T. Attia.
class ContentProvider < ActiveRecord::Base
  has_one :registered_user
  has_many :activities
  self.primary_key = 'registered_user_id'
end
