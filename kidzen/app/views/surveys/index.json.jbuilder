json.array!(@surveys) do |survey|
  json.extract! survey, :id, :survey_question, :survey_answers
  json.url survey_url(survey, format: :json)
end
