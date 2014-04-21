json.array!(@profile_musics) do |profile_music|
  json.extract! profile_music, :id, :youtube_url, :user_id
  json.url profile_music_url(profile_music, format: :json)
end
