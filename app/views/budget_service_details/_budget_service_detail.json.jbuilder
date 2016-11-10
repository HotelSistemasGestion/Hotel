json.extract! budget_service_detail, :id, :budget_id, :cantidad, :service_id, :subtotal, :created_at, :updated_at
json.url budget_service_detail_url(budget_service_detail, format: :json)