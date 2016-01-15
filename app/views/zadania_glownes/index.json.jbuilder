json.array!(@zadania_glownes) do |zadania_glowne|
  json.extract! zadania_glowne, :id
  json.url zadania_glowne_url(zadania_glowne, format: :json)
end
