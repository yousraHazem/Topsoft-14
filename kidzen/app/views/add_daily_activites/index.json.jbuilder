json.array!(@add_daily_activites) do |add_daily_activite|
  json.extract! add_daily_activite, :id, :child_id, :activity
  json.url add_daily_activite_url(add_daily_activite, format: :json)
end
