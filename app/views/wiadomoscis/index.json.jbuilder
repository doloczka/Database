json.array!(@wiadomoscis) do |wiadomosci|
  json.extract! wiadomosci, :id
  json.url wiadomosci_url(wiadomosci, format: :json)
end
