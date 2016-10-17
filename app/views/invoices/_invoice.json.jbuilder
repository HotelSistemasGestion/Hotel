json.extract! invoice, :id, :numero, :client_id, :fecha, :descuento, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)