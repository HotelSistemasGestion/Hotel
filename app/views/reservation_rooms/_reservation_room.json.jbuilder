json.extract! reservation_room, :id, :reservation_id, :room_id, :subtotal, :created_at, :updated_at
json.url reservation_room_url(reservation_room, format: :json)