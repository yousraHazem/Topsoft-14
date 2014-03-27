# The model representing 
# Permissions
# abilities is a key,bool hash
# Authors: Ahmed H. Ismail
class Permission < ActiveRecord::Base
  belongs_to :registered_user
  serialize :abilities, Hash
  after_initialize  :hash_default
  after_create :hash_default

  def hash_default
    self[:abilities].default = false
  end

  def create_account?
    abilities[:account_creation]
  end

  def view_content?(content)
  end

  # FIXME: who can ban ?
  def ban?(me, user)
  end

  def view_history?(me, child)
    true
  end

  def see_progress?(me, child)
  end

  def add_activity?
  end

  def watch_videos?
  end

  def report_post?
  end
end
