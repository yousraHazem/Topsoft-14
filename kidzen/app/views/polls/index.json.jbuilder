json.array!(@polls) do |poll|
  json.extract! poll, :id, :poll_question, :poll_answers
  json.url poll_url(poll, format: :json)
end
