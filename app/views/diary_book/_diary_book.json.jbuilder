json.extract! diary_book, :id, :accounting_entry_id, :accounting_account_id, :monto, :observacion, :created_at, :updated_at
json.url diary_book_url(diary_book, format: :json)