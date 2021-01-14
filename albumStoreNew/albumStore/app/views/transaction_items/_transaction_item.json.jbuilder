json.extract! transaction_item, :id, :album_id, :user_id, :price, :number, :created_at, :updated_at
json.url transaction_item_url(transaction_item, format: :json)
