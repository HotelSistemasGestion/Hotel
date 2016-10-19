json.extract! photo, :id, :room_id, :my_file, :created_at, :updated_at
json.url photo_url(photo, format: :json)