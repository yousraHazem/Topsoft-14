class Activity < ActiveRecord::Base
	searchkick autocomplete: [:name]
  belongs_to :topic
  has_many :activity_accounts
  has_many :children, :through=>:activity_accounts

  #returns the available activities for the child according to his age
  # Authors: Khaled I. Elhossiny
  def self.available(age)
    where("activities.min_age<=? AND activities.max_age>=?",age,age)
  end
end
