json.array!(@levels) do |level|
  json.extract! level, :rank, :name, :title
  json.url level_url(level, format: :json)
end