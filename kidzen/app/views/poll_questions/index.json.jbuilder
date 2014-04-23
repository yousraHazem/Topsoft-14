json.array!(@poll_questions) do |poll_question|
  json.extract! poll_question, :id, :content, :open_close
  json.url poll_question_url(poll_question, format: :json)
end
