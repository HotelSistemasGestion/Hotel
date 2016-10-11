json.extract! employee, :id, :types_of_employee_id, :nombre, :apellido, :edad, :cedula, :telefono, :correo, :direccion, :hijo, :created_at, :updated_at
json.url employee_url(employee, format: :json)