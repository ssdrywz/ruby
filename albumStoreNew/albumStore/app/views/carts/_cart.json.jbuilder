json.extract! cart, :id, :album_id, :user_id, :price, :number, :created_at, :updated_at
json.url cart_url(cart, format: :json)
