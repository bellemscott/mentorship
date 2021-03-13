json.extract! user, :id, :firstname, :lastname, :email, :password, :password_digest, :mentor, :mentee, :created_at, :updated_at
json.url user_url(user, format: :json)
