json.extract! reservation, :id, :nombre, :email, :dias, :type_of_room_id, :total, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)