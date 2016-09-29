# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD

ActiveRecord::Schema.define(version: 20160928005947) do

=======
ActiveRecord::Schema.define(version: 20160928005947) do
>>>>>>> 35fe10f882090135e42e3d21e3449f1af8637751

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_plans", force: :cascade do |t|
    t.integer  "accounting_year_id"
    t.string   "descripcion"
    t.string   "estado"
    t.string   "version"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "account_plans", ["accounting_year_id"], name: "index_account_plans_on_accounting_year_id", using: :btree

  create_table "account_x_accounting_entries", force: :cascade do |t|
    t.integer  "accounting_entry_id"
    t.integer  "accounting_account_id"
    t.integer  "monto"
    t.string   "observacion"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "account_x_accounting_entries", ["accounting_account_id"], name: "index_account_x_accounting_entries_on_accounting_account_id", using: :btree
  add_index "account_x_accounting_entries", ["accounting_entry_id"], name: "index_account_x_accounting_entries_on_accounting_entry_id", using: :btree

  create_table "account_x_auto_entries", force: :cascade do |t|
    t.integer  "account_x_entry_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "account_x_auto_entries", ["account_x_entry_id"], name: "index_account_x_auto_entries_on_account_x_entry_id", using: :btree

  create_table "account_x_automatic_entries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "account_x_entries", force: :cascade do |t|
    t.integer  "accounting_entry_id"
    t.integer  "accounting_account_id"
    t.integer  "monto"
    t.string   "observacion"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "account_x_entries", ["accounting_account_id"], name: "index_account_x_entries_on_accounting_account_id", using: :btree
  add_index "account_x_entries", ["accounting_entry_id"], name: "index_account_x_entries_on_accounting_entry_id", using: :btree

  create_table "account_x_plans", force: :cascade do |t|
    t.integer  "account_plan_id"
    t.integer  "accounting_account_id"
    t.integer  "cuenta_superior"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "account_x_plans", ["account_plan_id"], name: "index_account_x_plans_on_account_plan_id", using: :btree
  add_index "account_x_plans", ["accounting_account_id"], name: "index_account_x_plans_on_accounting_account_id", using: :btree

  create_table "accounting_accounts", force: :cascade do |t|
    t.integer  "grupo"
    t.string   "nombre"
    t.boolean  "imputable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounting_entries", force: :cascade do |t|
    t.integer  "numero"
    t.date     "fecha"
    t.integer  "iva"
    t.integer  "debe"
    t.integer  "haber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounting_years", force: :cascade do |t|
    t.integer  "anho"
    t.string   "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.integer  "client_id"
    t.date     "fecha_entrada"
    t.date     "fecha_salida"
    t.integer  "total"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "accounts", ["client_id"], name: "index_accounts_on_client_id", using: :btree

  create_table "cash_counts", force: :cascade do |t|
    t.date     "fecha_arqueo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "cash_movements", force: :cascade do |t|
    t.integer  "monto_total"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cashes", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "telefono"
    t.string   "email"
    t.text     "direccion"
    t.string   "cedula"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
=======
>>>>>>> 35fe10f882090135e42e3d21e3449f1af8637751
  create_table "closing_cashes", force: :cascade do |t|
    t.date     "fecha_cierre"
    t.integer  "monto_efectivo"
    t.integer  "monto_cheque"
    t.integer  "monto_tcredito"
    t.integer  "monto_tdebito"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

<<<<<<< HEAD
>>>>>>> origin/master
=======
>>>>>>> 35fe10f882090135e42e3d21e3449f1af8637751
  create_table "comforts", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "detail_of_cash_counts", force: :cascade do |t|
    t.integer  "monto_sistema"
    t.integer  "monto_caja"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "detail_of_cash_movements", force: :cascade do |t|
    t.integer  "sub_monto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detail_of_payment_types", force: :cascade do |t|
    t.string   "titular"
    t.string   "banco"
    t.integer  "numero"
    t.string   "tipo_tarjeta"
    t.date     "fecha_disponibilidad"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "entries", force: :cascade do |t|
    t.integer  "numero"
    t.date     "fecha"
    t.integer  "debe"
    t.integer  "haber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

>>>>>>> master
  create_table "invoices", force: :cascade do |t|
    t.integer  "numero"
    t.integer  "client_id"
    t.date     "fecha"
    t.integer  "descuento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "invoices", ["client_id"], name: "index_invoices_on_client_id", using: :btree

  create_table "opening_cashes", force: :cascade do |t|
    t.date     "fecha_apertura"
    t.integer  "monto_efectivo"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "payment_types", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reservation_requests", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "email"
    t.string   "telefono"
    t.integer  "cantidad_de_adultos"
    t.integer  "cantidad_de_ninhos"
    t.integer  "cantidad_de_familias"
    t.date     "check_in"
    t.date     "check_out"
    t.text     "comentarios"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "room_comforts", force: :cascade do |t|
    t.integer  "room_id"
    t.integer  "comfort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "room_comforts", ["comfort_id"], name: "index_room_comforts_on_comfort_id", using: :btree
  add_index "room_comforts", ["room_id"], name: "index_room_comforts_on_room_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.integer  "type_of_room_id"
    t.integer  "state_id"
    t.integer  "capacidad"
    t.string   "identificador"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "rooms", ["state_id"], name: "index_rooms_on_state_id", using: :btree
  add_index "rooms", ["type_of_room_id"], name: "index_rooms_on_type_of_room_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "precio"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_of_cash_movements", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_of_rooms", force: :cascade do |t|
    t.string   "tipo"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "account_plans", "accounting_years"
  add_foreign_key "account_x_accounting_entries", "accounting_accounts"
  add_foreign_key "account_x_accounting_entries", "accounting_entries"
  add_foreign_key "account_x_auto_entries", "account_x_entries"
  add_foreign_key "account_x_entries", "accounting_accounts"
  add_foreign_key "account_x_entries", "accounting_entries"
  add_foreign_key "account_x_plans", "account_plans"
  add_foreign_key "account_x_plans", "accounting_accounts"
  add_foreign_key "accounts", "clients"
  add_foreign_key "invoices", "clients"
  add_foreign_key "room_comforts", "comforts"
  add_foreign_key "room_comforts", "rooms"
  add_foreign_key "rooms", "states"
  add_foreign_key "rooms", "type_of_rooms"
end
