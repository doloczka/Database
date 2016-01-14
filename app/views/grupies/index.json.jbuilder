json.array!(@grupies) do |grupy|
  json.extract! grupy, :id
  json.url grupy_url(grupy, format: :json)
end
