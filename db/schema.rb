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

ActiveRecord::Schema.define(version: 2020_12_04_091819) do

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.text "image"
    t.integer "send_order_count"
    t.integer "receive_order_count"
    t.text "contact_mail"
    t.bigint "industry_id", default: 0, null: false
    t.bigint "operating_status_id", default: 0, null: false
    t.string "company_name"
    t.text "business_content"
    t.string "postal_code"
    t.bigint "prefectures_id", default: 0, null: false
    t.string "city"
    t.string "address"
    t.text "building"
    t.integer "phone_number"
    t.bigint "gender_id", default: 0
    t.integer "age"
    t.string "capabilities"
    t.text "performance"
    t.text "profile"
    t.integer "suggested_price"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["gender_id"], name: "index_users_on_gender_id"
    t.index ["industry_id"], name: "index_users_on_industry_id"
    t.index ["operating_status_id"], name: "index_users_on_operating_status_id"
    t.index ["prefectures_id"], name: "index_users_on_prefectures_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
