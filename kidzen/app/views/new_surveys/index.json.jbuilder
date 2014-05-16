json.array!(@new_surveys) do |new_survey|
  json.extract! new_survey, :id, :name, :user_id
  json.url new_survey_url(new_survey, format: :json)
end
