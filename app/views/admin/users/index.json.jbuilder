json.array!(@users) do |user|
  json.extract! user, :role_id, :login, :password_digest, :remember_token
  json.url user_url(user, format: :json)
end