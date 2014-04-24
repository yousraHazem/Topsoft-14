# The model representing 
# Permissions
# abilities is a key,bool hash
# Authors: Ahmed H. Ismail
class Permission < ActiveRecord::Base
  belongs_to :registered_user
  serialize :abilities, Hash
  after_initialize  :hash_default
  after_create :hash_default

  # Returns default permissions
  # for supervisors
  # Authors: Ahmed H. Ismail
  def self.supervisor_default
    perm_hash = Hash.new
    perm_hash[:account_creation] = true
    perm_hash[:supervisor] = true
    perm_hash[:child] = false
    Permission.new(abilities: perm_hash)
  end


  # Returns default permissions
  # for supervisors
  # Authors: Ahmed H. Ismail
  def self.child_default
    perm_hash = Hash.new
    perm_hash[:account_creation] = false
    perm_hash[:supervisor] = false
    perm_hash[:child] = true
    Permission.new(abilities: perm_hash)
  end


  def hash_default
    self[:abilities].default = false
  end

  # Can create an account?
  # Authors: Ahmed H. Ismail
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
