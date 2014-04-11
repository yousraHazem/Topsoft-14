json.array!(@children) do |child|
  json.extract! child, :id, :approved, :guardian_email, :user_name, :password, :first_name, :birth_of_date, :gender
  json.url child_url(child, format: :json)
end
