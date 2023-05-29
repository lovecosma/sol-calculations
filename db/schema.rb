# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_29_045115) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charts", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name", default: ""
    t.string "last_name", null: false
    t.date "birthdate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "soul_urge_id"
    t.integer "personality_id"
    t.integer "life_path_id"
    t.integer "expression_id"
    t.integer "formative_id"
    t.integer "harvest_id"
    t.integer "productive_id"
    t.integer "first_minor_id"
    t.integer "second_minor_id"
    t.integer "major_id"
    t.integer "attainment_id"
    t.integer "foundation_id"
    t.integer "obligation_id"
    t.integer "retrospection_id"
  end

  create_table "numbers", force: :cascade do |t|
    t.string "type", null: false
    t.integer "number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "personal_chart_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "charts", "users"
end
