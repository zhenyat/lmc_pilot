json.array!(@employees) do |employee|
  json.extract! employee, :store_id, :department_id, :position_id, :level_id, :manager_id, :surname, :name, :middle_name, :pin, :active
  json.url employee_url(employee, format: :json)
end