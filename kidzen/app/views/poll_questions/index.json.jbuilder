json.array!(@poll_questions) do |poll_question|
  json.extract! poll_question, :id, :content, :user_id
  json.url poll_question_url(poll_question, format: :json)
end
