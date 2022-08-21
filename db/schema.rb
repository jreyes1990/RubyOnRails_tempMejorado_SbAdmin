# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_08_19_075921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "nombre", limit: 200
    t.text "descripcion"
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.string "estado", limit: 10
    t.bigint "empresa_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["empresa_id"], name: "index_areas_on_empresa_id"
  end

  create_table "atributos", force: :cascade do |t|
    t.string "nombre", limit: 200
    t.text "descripcion"
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.string "estado", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "componentes", force: :cascade do |t|
    t.string "nombre", limit: 200
    t.text "descripcion"
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.string "estado", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "empresas", force: :cascade do |t|
    t.string "nombre", limit: 200
    t.text "descripcion"
    t.integer "codigo_empresa"
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.string "estado", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menu_roles", force: :cascade do |t|
    t.integer "menu_padre"
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.string "estado", limit: 10
    t.bigint "rol_id", null: false
    t.bigint "opcion_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["opcion_id"], name: "index_menu_roles_on_opcion_id"
    t.index ["rol_id"], name: "index_menu_roles_on_rol_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "nombre", limit: 200
    t.text "icono"
    t.text "descripcion"
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.string "estado", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "opcion_cas", force: :cascade do |t|
    t.text "descripcion"
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.string "estado", limit: 10
    t.bigint "componente_id", null: false
    t.bigint "atributo_id", null: false
    t.bigint "opcion_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["atributo_id"], name: "index_opcion_cas_on_atributo_id"
    t.index ["componente_id"], name: "index_opcion_cas_on_componente_id"
    t.index ["opcion_id"], name: "index_opcion_cas_on_opcion_id"
  end

  create_table "opciones", force: :cascade do |t|
    t.string "nombre", limit: 200
    t.text "icono"
    t.text "path"
    t.text "descripcion"
    t.string "controlador", limit: 300
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.string "estado", limit: 10
    t.bigint "menu_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["menu_id"], name: "index_opciones_on_menu_id"
  end

  create_table "persona_empresa_formularios", force: :cascade do |t|
    t.text "descripcion"
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.string "estado", limit: 10
    t.bigint "opcion_ca_id", null: false
    t.bigint "personas_area_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["opcion_ca_id"], name: "index_persona_empresa_formularios_on_opcion_ca_id"
    t.index ["personas_area_id"], name: "index_persona_empresa_formularios_on_personas_area_id"
  end

  create_table "personas", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "apellido", limit: 100
    t.string "foto"
    t.integer "telefono"
    t.text "direccion"
    t.string "token", limit: 1000
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.string "estado", limit: 10
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_personas_on_user_id"
  end

  create_table "personas_areas", force: :cascade do |t|
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.string "estado", limit: 10
    t.bigint "area_id", null: false
    t.bigint "persona_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "index_personas_areas_on_area_id"
    t.index ["persona_id"], name: "index_personas_areas_on_persona_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "nombre", limit: 200
    t.text "descripcion"
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.string "estado", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.string "estado", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "areas", "empresas"
  add_foreign_key "menu_roles", "opciones"
  add_foreign_key "menu_roles", "roles"
  add_foreign_key "opcion_cas", "atributos"
  add_foreign_key "opcion_cas", "componentes"
  add_foreign_key "opcion_cas", "opciones"
  add_foreign_key "opciones", "menus"
  add_foreign_key "persona_empresa_formularios", "opcion_cas"
  add_foreign_key "persona_empresa_formularios", "personas_areas"
  add_foreign_key "personas", "users"
  add_foreign_key "personas_areas", "areas"
  add_foreign_key "personas_areas", "personas"
end
