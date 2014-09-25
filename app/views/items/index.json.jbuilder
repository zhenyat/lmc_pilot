json.array!(@items) do |item|
  json.extract! item, :id, :assessment_id, :behavior_id, :user_tick, :final_tick
  json.url item_url(item, format: :json)
end
