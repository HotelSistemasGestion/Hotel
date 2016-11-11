json.extract! budget_room_detail, :id, :budget, :cantidad, :type_of_room, :subtotal, :created_at, :updated_at
json.url budget_room_detail_url(budget_room_detail, format: :json)