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

ActiveRecord::Schema.define(version: 2021_10_12_093727) do

  create_table "cabinets", charset: "utf8mb4", force: :cascade do |t|
    t.string "title_cabinet"
    t.string "prime_minister_name"
    t.string "chief_cabinet_secretary_name"
    t.string "finance_minister_name"
    t.string "comprehensive_minister_name"
    t.string "economy_minister_name"
    t.string "education_minister_name"
    t.string "welfare_minister_name"
    t.string "diplomacy_minister_name"
    t.string "defense_minister_name"
    t.string "agriculture_minister_name"
    t.string "traffic_minister_name"
    t.string "law_minister_name"
    t.string "green_minister_name"
    t.string "digital_minister_name"
    t.string "reconstruction_minister_name"
    t.string "public_security_minister_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_cabinets_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cabinets", "users"
end
