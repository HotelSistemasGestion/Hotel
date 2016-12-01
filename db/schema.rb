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

ActiveRecord::Schema.define(version: 20161130213524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_details", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "service_id"
    t.integer  "cantidad"
    t.integer  "precio"
    t.integer  "subtotal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "servicio"
  end

  add_index "account_details", ["account_id"], name: "index_account_details_on_account_id", using: :btree

  create_table "account_plans", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "estado"
    t.string   "version"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "account_x_auto_entries", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "account_x_entry_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "account_x_auto_entries", ["account_x_entry_id"], name: "index_account_x_auto_entries_on_account_x_entry_id", using: :btree

  create_table "account_x_auto_entry_dets", force: :cascade do |t|
    t.string   "imputable_tipo"
    t.integer  "account_x_auto_entry_id"
    t.integer  "accounting_account_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "account_x_auto_entry_dets", ["account_x_auto_entry_id"], name: "index_account_x_auto_entry_dets_on_account_x_auto_entry_id", using: :btree
  add_index "account_x_auto_entry_dets", ["accounting_account_id"], name: "index_account_x_auto_entry_dets_on_accounting_account_id", using: :btree

  create_table "account_x_entries", force: :cascade do |t|
    t.integer  "accounting_entry_id"
    t.integer  "accounting_account_id"
    t.integer  "monto"
    t.string   "observacion"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "tipo"
    t.string   "account"
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
    t.integer  "cuenta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "ejercicio"
    t.integer  "parent_id"
  end

  create_table "accounting_entries", force: :cascade do |t|
    t.integer  "numero"
    t.date     "fecha"
    t.integer  "iva"
    t.integer  "debe"
    t.integer  "haber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "auto"
  end

  create_table "accounting_years", force: :cascade do |t|
    t.integer  "anho"
    t.string   "estado"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "account_plan_id"
  end

  add_index "accounting_years", ["account_plan_id"], name: "index_accounting_years_on_account_plan_id", using: :btree

  create_table "accounts", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "nombre"
    t.string   "direccion"
    t.string   "ruc"
    t.string   "telefono"
    t.string   "correo"
    t.integer  "subtotal"
    t.integer  "descuento"
    t.string   "numero"
    t.integer  "iva"
  end

  add_index "accounts", ["client_id"], name: "index_accounts_on_client_id", using: :btree

  create_table "actions", force: :cascade do |t|
    t.string   "accion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

  create_table "budget_room_details", force: :cascade do |t|
    t.integer  "budget_id"
    t.integer  "cantidad"
    t.integer  "type_of_room_id"
    t.integer  "subtotal"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "budget_room_details", ["budget_id"], name: "index_budget_room_details_on_budget_id", using: :btree
  add_index "budget_room_details", ["type_of_room_id"], name: "index_budget_room_details_on_type_of_room_id", using: :btree

  create_table "budget_service_details", force: :cascade do |t|
    t.integer  "budget_id"
    t.integer  "cantidad"
    t.integer  "service_id"
    t.integer  "subtotal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "budget_service_details", ["budget_id"], name: "index_budget_service_details_on_budget_id", using: :btree
  add_index "budget_service_details", ["service_id"], name: "index_budget_service_details_on_service_id", using: :btree

  create_table "budgets", force: :cascade do |t|
    t.integer  "reservation_request_id"
    t.integer  "comfort_id"
    t.date     "check_in"
    t.date     "check_out"
    t.text     "comentario"
    t.integer  "descuento"
    t.integer  "total"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "budgets", ["comfort_id"], name: "index_budgets_on_comfort_id", using: :btree
  add_index "budgets", ["reservation_request_id"], name: "index_budgets_on_reservation_request_id", using: :btree

  create_table "cash_movements", force: :cascade do |t|
    t.integer  "monto_total"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "type_of_cash_movement_id"
    t.integer  "opening_cash_id"
    t.integer  "accounting_entry_id"
    t.integer  "client_id"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "ruc"
    t.string   "direccion"
    t.date     "fecha"
  end

  add_index "cash_movements", ["accounting_entry_id"], name: "index_cash_movements_on_accounting_entry_id", using: :btree
  add_index "cash_movements", ["client_id"], name: "index_cash_movements_on_client_id", using: :btree
  add_index "cash_movements", ["opening_cash_id"], name: "index_cash_movements_on_opening_cash_id", using: :btree
  add_index "cash_movements", ["type_of_cash_movement_id"], name: "index_cash_movements_on_type_of_cash_movement_id", using: :btree

  create_table "cashes", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "estado"
  end

  create_table "checks", force: :cascade do |t|
    t.string   "banco"
    t.string   "titular"
    t.date     "fecha_disponibilidad"
    t.string   "n_cheque"
    t.integer  "total"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "cleaning_rooms", force: :cascade do |t|
    t.integer  "room_id"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "start"
    t.date     "end"
    t.string   "title"
    t.string   "color"
    t.string   "textColor"
  end

  add_index "cleaning_rooms", ["employee_id"], name: "index_cleaning_rooms_on_employee_id", using: :btree
  add_index "cleaning_rooms", ["room_id"], name: "index_cleaning_rooms_on_room_id", using: :btree

  create_table "cleanings", force: :cascade do |t|
    t.integer  "cleaning_room_id"
    t.integer  "room_id"
    t.date     "start"
    t.date     "end"
    t.string   "title"
    t.string   "color"
    t.string   "textColor"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "employee_id"
  end

  add_index "cleanings", ["cleaning_room_id"], name: "index_cleanings_on_cleaning_room_id", using: :btree
  add_index "cleanings", ["employee_id"], name: "index_cleanings_on_employee_id", using: :btree
  add_index "cleanings", ["room_id"], name: "index_cleanings_on_room_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "telefono"
    t.string   "email"
    t.text     "direccion"
    t.string   "cedula"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ruc"
  end

  create_table "closing_cashes", force: :cascade do |t|
    t.date     "fecha_cierre"
    t.integer  "monto_efectivo"
    t.integer  "monto_cheque"
    t.integer  "monto_tcredito"
    t.integer  "monto_tdebito"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "existente_efe"
    t.integer  "existente_cheque"
    t.integer  "existente_tcre"
    t.integer  "existente_tdb"
    t.integer  "opening_cash_id"
    t.integer  "dif_registrada"
  end

  add_index "closing_cashes", ["opening_cash_id"], name: "index_closing_cashes_on_opening_cash_id", using: :btree

  create_table "comforts", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "precio"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "complaint_services", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "complaints", force: :cascade do |t|
    t.string   "description"
    t.integer  "complaint_service_id"
    t.string   "service_description"
    t.boolean  "state"
    t.integer  "room_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "complaints", ["complaint_service_id"], name: "index_complaints_on_complaint_service_id", using: :btree
  add_index "complaints", ["room_id"], name: "index_complaints_on_room_id", using: :btree

  create_table "detail_of_cash_movements", force: :cascade do |t|
    t.integer  "sub_monto"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "cash_movement_id"
    t.integer  "invoice_id"
  end

  add_index "detail_of_cash_movements", ["cash_movement_id"], name: "index_detail_of_cash_movements_on_cash_movement_id", using: :btree
  add_index "detail_of_cash_movements", ["invoice_id"], name: "index_detail_of_cash_movements_on_invoice_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.integer  "types_of_employee_id"
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "edad"
    t.integer  "cedula"
    t.integer  "telefono"
    t.string   "correo"
    t.string   "direccion"
    t.integer  "hijo"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "estado"
  end

  add_index "employees", ["types_of_employee_id"], name: "index_employees_on_types_of_employee_id", using: :btree

  create_table "invoice_details", force: :cascade do |t|
    t.integer  "invoice_id"
    t.integer  "service_id"
    t.integer  "cantidad"
    t.integer  "precio"
    t.integer  "subtotal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "servicio"
  end

  add_index "invoice_details", ["invoice_id"], name: "index_invoice_details_on_invoice_id", using: :btree

  create_table "invoices", force: :cascade do |t|
    t.string   "numero"
    t.integer  "client_id"
    t.date     "fecha"
    t.integer  "descuento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "nombre"
    t.string   "direccion"
    t.string   "ruc"
    t.integer  "total"
    t.integer  "subtotal"
    t.string   "celular"
    t.string   "correo"
    t.string   "state"
    t.integer  "account_id"
    t.integer  "iva"
  end

  add_index "invoices", ["client_id"], name: "index_invoices_on_client_id", using: :btree

  create_table "opening_cashes", force: :cascade do |t|
    t.date     "fecha_apertura"
    t.integer  "monto_efectivo"
    t.string   "estado"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "employee_id"
    t.integer  "cash_id"
    t.integer  "final_efectivo"
    t.integer  "final_cheque"
    t.integer  "final_credito"
    t.integer  "final_debito"
  end

  add_index "opening_cashes", ["cash_id"], name: "index_opening_cashes_on_cash_id", using: :btree
  add_index "opening_cashes", ["employee_id"], name: "index_opening_cashes_on_employee_id", using: :btree

  create_table "payment_types", force: :cascade do |t|
    t.string   "total"
    t.string   "titular"
    t.string   "banco"
    t.string   "n_cheque"
    t.string   "tarjeta_tipo"
    t.date     "fecha_disponibilidad"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "cash_movement_id"
    t.integer  "payment_value_id"
  end

  add_index "payment_types", ["cash_movement_id"], name: "index_payment_types_on_cash_movement_id", using: :btree
  add_index "payment_types", ["payment_value_id"], name: "index_payment_types_on_payment_value_id", using: :btree

  create_table "payment_values", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "room_id"
    t.string   "my_file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "photos", ["room_id"], name: "index_photos_on_room_id", using: :btree
  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "reservation_requests", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "email"
    t.string   "telefono"
    t.integer  "comfort_id"
    t.integer  "cantidad_de_adultos"
    t.integer  "cantidad_de_ninhos"
    t.integer  "cantidad_de_familias"
    t.date     "check_in"
    t.date     "check_out"
    t.text     "comentarios"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "reservation_requests", ["comfort_id"], name: "index_reservation_requests_on_comfort_id", using: :btree

  create_table "reservation_rooms", force: :cascade do |t|
    t.integer  "reservation_id"
    t.integer  "type_of_room_id"
    t.integer  "comfort_id"
    t.integer  "room_id"
    t.date     "check_in"
    t.date     "check_out"
    t.integer  "subtotal",        limit: 8
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.date     "start"
    t.date     "end"
    t.string   "title"
    t.string   "textColor"
    t.string   "color"
  end

  add_index "reservation_rooms", ["comfort_id"], name: "index_reservation_rooms_on_comfort_id", using: :btree
  add_index "reservation_rooms", ["reservation_id"], name: "index_reservation_rooms_on_reservation_id", using: :btree
  add_index "reservation_rooms", ["room_id"], name: "index_reservation_rooms_on_room_id", using: :btree
  add_index "reservation_rooms", ["type_of_room_id"], name: "index_reservation_rooms_on_type_of_room_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "email"
    t.string   "telefono"
    t.integer  "budget_id_id"
    t.string   "total",        limit: 8
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rol_actions", force: :cascade do |t|
    t.integer  "rol_id"
    t.integer  "action_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rol_actions", ["action_id"], name: "index_rol_actions_on_action_id", using: :btree
  add_index "rol_actions", ["rol_id"], name: "index_rol_actions_on_rol_id", using: :btree

  create_table "rols", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_account_details", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "room_id"
    t.integer  "type_of_room_id"
    t.integer  "comfort_id"
    t.date     "check_in"
    t.date     "check_out"
    t.integer  "subtotal",        limit: 8
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "room_account_details", ["account_id"], name: "index_room_account_details_on_account_id", using: :btree
  add_index "room_account_details", ["comfort_id"], name: "index_room_account_details_on_comfort_id", using: :btree
  add_index "room_account_details", ["room_id"], name: "index_room_account_details_on_room_id", using: :btree
  add_index "room_account_details", ["type_of_room_id"], name: "index_room_account_details_on_type_of_room_id", using: :btree

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
    t.integer  "precio"
    t.integer  "comfort_id"
  end

  add_index "rooms", ["comfort_id"], name: "index_rooms_on_comfort_id", using: :btree
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
    t.integer  "precio"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "types_of_employees", force: :cascade do |t|
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
    t.string   "username"
    t.string   "apellido"
    t.integer  "numero_ci"
    t.string   "telefono"
    t.string   "celular"
    t.integer  "roles_mask"
    t.string   "direccion"
    t.integer  "rol_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["rol_id"], name: "index_users_on_rol_id", using: :btree

  add_foreign_key "account_details", "accounts"
  add_foreign_key "account_x_auto_entries", "account_x_entries"
  add_foreign_key "account_x_auto_entry_dets", "account_x_auto_entries"
  add_foreign_key "account_x_auto_entry_dets", "accounting_accounts"
  add_foreign_key "account_x_entries", "accounting_accounts"
  add_foreign_key "account_x_entries", "accounting_entries"
  add_foreign_key "account_x_plans", "account_plans"
  add_foreign_key "account_x_plans", "accounting_accounts"
  add_foreign_key "accounting_years", "account_plans"
  add_foreign_key "accounts", "clients"
  add_foreign_key "budget_room_details", "budgets"
  add_foreign_key "budget_room_details", "type_of_rooms"
  add_foreign_key "budget_service_details", "budgets"
  add_foreign_key "budget_service_details", "services"
  add_foreign_key "budgets", "comforts"
  add_foreign_key "budgets", "reservation_requests"
  add_foreign_key "cash_movements", "accounting_entries"
  add_foreign_key "cash_movements", "clients"
  add_foreign_key "cash_movements", "opening_cashes"
  add_foreign_key "cash_movements", "type_of_cash_movements"
  add_foreign_key "cleaning_rooms", "employees"
  add_foreign_key "cleaning_rooms", "rooms"
  add_foreign_key "cleanings", "cleaning_rooms"
  add_foreign_key "cleanings", "employees"
  add_foreign_key "cleanings", "rooms"
  add_foreign_key "closing_cashes", "opening_cashes"
  add_foreign_key "complaints", "complaint_services"
  add_foreign_key "complaints", "rooms"
  add_foreign_key "detail_of_cash_movements", "cash_movements"
  add_foreign_key "detail_of_cash_movements", "invoices"
  add_foreign_key "employees", "types_of_employees"
  add_foreign_key "invoice_details", "invoices"
  add_foreign_key "invoices", "clients"
  add_foreign_key "opening_cashes", "cashes"
  add_foreign_key "opening_cashes", "employees"
  add_foreign_key "payment_types", "cash_movements"
  add_foreign_key "payment_types", "payment_values"
  add_foreign_key "photos", "rooms"
  add_foreign_key "photos", "users"
  add_foreign_key "reservation_requests", "comforts"
  add_foreign_key "reservation_rooms", "comforts"
  add_foreign_key "reservation_rooms", "reservations"
  add_foreign_key "reservation_rooms", "rooms"
  add_foreign_key "reservation_rooms", "type_of_rooms"
  add_foreign_key "rol_actions", "actions"
  add_foreign_key "rol_actions", "rols"
  add_foreign_key "room_account_details", "accounts"
  add_foreign_key "room_account_details", "comforts"
  add_foreign_key "room_account_details", "rooms"
  add_foreign_key "room_account_details", "type_of_rooms"
  add_foreign_key "room_comforts", "comforts"
  add_foreign_key "room_comforts", "rooms"
  add_foreign_key "rooms", "comforts"
  add_foreign_key "rooms", "states"
  add_foreign_key "rooms", "type_of_rooms"
  add_foreign_key "users", "rols"
end
