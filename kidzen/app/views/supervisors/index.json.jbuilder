json.array!(@supervisors) do |supervisor|
  json.extract! supervisor, :id, :personal_id, :phone_num, :address
  json.url supervisor_url(supervisor, format: :json)
end
