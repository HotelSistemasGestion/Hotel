json.extract! service, :id, :nombre, :descripcion, :precio, :created_at, :updated_at
json.url service_url(service, format: :json)