json.extract! accounting_entry, :id, :numero, :fecha, :iva, :debe, :haber, :created_at, :updated_at
json.url accounting_entry_url(accounting_entry, format: :json)