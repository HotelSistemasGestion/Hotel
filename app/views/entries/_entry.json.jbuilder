json.extract! entry, :id, :numero, :fecha, :debe, :haber, :created_at, :updated_at
json.url entry_url(entry, format: :json)