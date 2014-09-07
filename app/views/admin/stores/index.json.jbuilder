json.array!(@stores) do |store|
  json.extract! store, :name, :title
  json.url store_url(store, format: :json)
end