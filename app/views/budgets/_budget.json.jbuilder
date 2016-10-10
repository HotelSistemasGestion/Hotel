json.extract! budget, :id, :reservation_request_id, :email, :dias, :descuento, :total, :created_at, :updated_at
json.url budget_url(budget, format: :json)