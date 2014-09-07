json.array!(@positions) do |position|
  json.extract! position, :name, :title
  json.url position_url(position, format: :json)
end