json.array!(@groups) do |group|
  json.extract! group, :id, :owner, :name, :statuses, :info, :numberOfMembers, :members
  json.url group_url(group, format: :json)
end
