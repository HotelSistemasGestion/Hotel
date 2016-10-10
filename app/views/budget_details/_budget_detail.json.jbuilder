json.extract! budget_detail, :id, :budget_id, :cantidad, :service_id, :subtotal, :created_at, :updated_at
json.url budget_detail_url(budget_detail, format: :json)