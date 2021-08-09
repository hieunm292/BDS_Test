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

ActiveRecord::Schema.define(version: 2021_08_06_073130) do

  create_table "accounts", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "email"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.index ["email"], name: "index_accounts_on_email", unique: true
  end

  create_table "properties", force: :cascade do |t|
    t.integer "account_id", null: false
    t.string "name"
    t.string "address"
    t.integer "price"
    t.integer "rooms"
    t.integer "bathrooms"
    t.string "photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id", "created_at"], name: "index_properties_on_account_id_and_created_at"
    t.index ["account_id"], name: "index_properties_on_account_id"
  end

  add_foreign_key "properties", "accounts"
end
