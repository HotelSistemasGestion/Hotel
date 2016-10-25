json.extract! reservation, :id, :nombre, :apellido, :check_in, :check_out, :type_of_room_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)