json.array!(@profiles) do |profile|
  json.extract! profile, :id, :location, :name, :date_time, :description
  json.url profile_url(profile, format: :json)
end
