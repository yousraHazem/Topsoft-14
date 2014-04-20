class PollQuestion < ActiveRecord::Base
  has_many :poll_answers, dependent: :destroy
  accepts_nested_attributes_for :poll_answers, :reject_if => :all_blank, :allow_destroy => true
end
