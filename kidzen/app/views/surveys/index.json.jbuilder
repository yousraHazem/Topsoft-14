json.array!(@surveys) do |survey|
  json.extract! survey, :id, :question, :asnwer1
  json.url survey_url(survey, format: :json)
end
