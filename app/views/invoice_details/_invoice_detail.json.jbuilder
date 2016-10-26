json.extract! invoice_detail, :id, :invoice_id, :service_id, :cantidad, :precio, :subtotal, :created_at, :updated_at
json.url invoice_detail_url(invoice_detail, format: :json)