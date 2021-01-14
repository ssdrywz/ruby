json.extract! transaction_order, :id, :transaction_item_id, :user_id, :delivery_name, :delivery_address, :delivery_phone, :delivery_postcode, :delivery_state, :amount, :created_at, :updated_at
json.url transaction_order_url(transaction_order, format: :json)
