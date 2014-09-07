json.array!(@behaviors) do |behavior|
  json.extract! behavior, :competency_id, :level_id, :content, :active
  json.url behavior_url(behavior, format: :json)
end