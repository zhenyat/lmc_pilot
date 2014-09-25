json.array!(@actioncards) do |actioncard|
  json.extract! actioncard, :competency_id, :level_id, :content
  json.url actioncard_url(actioncard, format: :json)
end