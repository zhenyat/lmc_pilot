json.array!(@assessments) do |assessment|
  json.extract! assessment, :id, :user_id, :closed, :max_level
  json.url assessment_url(assessment, format: :json)
end
