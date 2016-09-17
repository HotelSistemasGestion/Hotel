json.extract! account, :id, :client_id, :fecha_entrada, :fecha_salida, :total, :created_at, :updated_at
json.url account_url(account, format: :json)