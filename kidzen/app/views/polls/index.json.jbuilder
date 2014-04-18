json.array!(@polls) do |poll|
  json.extract! poll, :id, :question, :asnwer1, :answer2, :answer3
  json.url poll_url(poll, format: :json)
end
