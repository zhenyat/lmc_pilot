json.array!(@clusters) do |cluster|
  json.extract! cluster, :name, :title, :mutual, :description
  json.url cluster_url(cluster, format: :json)
end