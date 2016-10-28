json.extract! account_detail, :id, :account_id, :service_id, :cantidad, :precio, :subtotal, :created_at, :updated_at
json.url account_detail_url(account_detail, format: :json)