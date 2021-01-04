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

ActiveRecord::Schema.define(version: 2020_12_24_044912) do

  create_table "clients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "hp_url"
    t.string "postal_code"
    t.bigint "prefecture_id", default: 0, null: false
    t.string "city"
    t.string "address"
    t.string "phone_number"
    t.integer "send_order_count"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["prefecture_id"], name: "index_clients_on_prefecture_id"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "contractors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "gender_id", default: 0, null: false
    t.integer "receive_order_count"
    t.string "suggested_price"
    t.bigint "operating_id", default: 0, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gender_id"], name: "index_contractors_on_gender_id"
    t.index ["operating_id"], name: "index_contractors_on_operating_id"
    t.index ["user_id"], name: "index_contractors_on_user_id"
  end

  create_table "industries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "ancestry"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ancestry"], name: "index_industries_on_ancestry"
  end

  create_table "matters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.integer "contractor_id"
    t.string "title", null: false
    t.text "matter_content", null: false
    t.date "start_on", null: false
    t.date "end_on", null: false
    t.string "contract_period", null: false
    t.bigint "industry_id", default: 1
    t.string "reward", null: false
    t.integer "number_of_positions", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_matters_on_client_id"
    t.index ["industry_id"], name: "index_matters_on_industry_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.text "contact_mail"
    t.text "profile"
    t.text "profile_image"
    t.bigint "industry_id", default: 1
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["industry_id"], name: "index_users_on_industry_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clients", "users"
  add_foreign_key "contractors", "users"
  add_foreign_key "matters", "clients"
end
