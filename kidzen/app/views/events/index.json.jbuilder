json.array!(@events) do |event|
  json.extract! event, :id, :location, :name, :date, :description
  json.url event_url(event, format: :json)
end
