class PollAnswer < ActiveRecord::Base
  belongs_to :poll_question
end
