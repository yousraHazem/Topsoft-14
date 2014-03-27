json.array!(@children) do |child|
  json.extract! child, :id, :user_name, :password, :date_of_birth, :guardian_email, :email
  json.url child_url(child, format: :json)
end
