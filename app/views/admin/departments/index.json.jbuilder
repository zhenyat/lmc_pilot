json.array!(@departments) do |department|
  json.extract! department, :number, :title
  json.url department_url(department, format: :json)
end