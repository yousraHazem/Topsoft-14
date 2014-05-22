json.array!(@ajax_posts) do |ajax_post|
  json.extract! ajax_post, :id, :user_id, :status
  json.url ajax_post_url(ajax_post, format: :json)
end
