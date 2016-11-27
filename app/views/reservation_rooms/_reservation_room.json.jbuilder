json.extract! reservation_room, :id, :reservation_id, :room_id, :subtotal,:start,:end, :title, :color,:textColor,:created_at, :updated_at
json.url reservation_room_url(reservation_room, format: :json)