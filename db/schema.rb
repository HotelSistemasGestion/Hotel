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

ActiveRecord::Schema.define(version: 20160927184329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_plans", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "estado"
    t.string   "version"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "account_x_plans", force: :cascade do |t|
    t.string   "cuenta_superior"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "accounting_accounts", force: :cascade do |t|
    t.string   "nombre"
    t.boolean  "imputable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounting_x_automatic_entries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounting_x_entries", force: :cascade do |t|
    t.integer  "monto"
    t.string   "observacion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

  create_table "budget_details", force: :cascade do |t|
    t.integer  "budget_id"
    t.integer  "service_id"
    t.integer  "cantidad"
    t.integer  "subtotal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "budget_details", ["budget_id"], name: "index_budget_details_on_budget_id", using: :btree
  add_index "budget_details", ["service_id"], name: "index_budget_details_on_service_id", using: :btree

  create_table "budgets", force: :cascade do |t|
    t.integer  "reservation_request_id"
    t.string   "email"
    t.integer  "type_of_room_id"
    t.integer  "cantidad_de_habitaciones"
    t.integer  "dias"
    t.integer  "descuento"
    t.integer  "total"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "budgets", ["reservation_request_id"], name: "index_budgets_on_reservation_request_id", using: :btree
  add_index "budgets", ["type_of_room_id"], name: "index_budgets_on_type_of_room_id", using: :btree

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

  create_table "comforts", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "entries", force: :cascade do |t|
    t.integer  "numero"
    t.date     "fecha"
    t.integer  "debe"
    t.integer  "haber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "numero"
    t.integer  "client_id"
    t.date     "fecha"
    t.integer  "descuento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "invoices", ["client_id"], name: "index_invoices_on_client_id", using: :btree

  create_table "reservation_requests", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "email"
    t.string   "telefono"
    t.integer  "type_of_room_id"
    t.integer  "cantidad_de_adultos"
    t.integer  "cantidad_de_ninhos"
    t.integer  "cantidad_de_familias"
    t.date     "check_in"
    t.date     "check_out"
    t.text     "comentarios"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "reservation_requests", ["type_of_room_id"], name: "index_reservation_requests_on_type_of_room_id", using: :btree

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

  add_foreign_key "accounts", "clients"
  add_foreign_key "budget_details", "budgets"
  add_foreign_key "budget_details", "services"
  add_foreign_key "budgets", "reservation_requests"
  add_foreign_key "budgets", "type_of_rooms"
  add_foreign_key "invoices", "clients"
  add_foreign_key "reservation_requests", "type_of_rooms"
  add_foreign_key "room_comforts", "comforts"
  add_foreign_key "room_comforts", "rooms"
  add_foreign_key "rooms", "states"
  add_foreign_key "rooms", "type_of_rooms"
end
