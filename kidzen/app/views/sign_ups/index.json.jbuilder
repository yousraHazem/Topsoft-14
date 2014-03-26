json.array!(@sign_ups) do |sign_up|
  json.extract! sign_up, :id, :Username, :Password, :Date_Of_Birth, :Gaurdian_Email, :Email
  json.url sign_up_url(sign_up, format: :json)
end
