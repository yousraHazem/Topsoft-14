class PollAnswer < ActiveRecord::Base
  belongs_to :poll_question
  has_many :sub_answers, dependent: :destroy
  accepts_nested_attributes_for :sub_answers, :reject_if => :all_blank, :allow_destroy => true
end
