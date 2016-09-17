json.extract! client, :id, :nombre, :apellido, :telefono, :email, :direccion, :cedula, :created_at, :updated_at
json.url client_url(client, format: :json)