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

#frozen_string_literals = true
ActiveRecord::Schema[7.1].define(version: 2024_01_20_064950) do
  create_table "addresses", force: :cascade do |t|
    t.string "road"
    t.string "number"
    t.string "neighborhood"
    t.string "city", default: "Almenara"
    t.string "state", default: "MG"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.decimal "priceOff"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "purchase_id", null: false
    t.integer "product_id", null: false
    t.decimal "amount", default: "1.0", null: false
    t.index ["product_id"], name: "index_items_on_product_id"
    t.index ["purchase_id"], name: "index_items_on_purchase_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.text "description"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "productCategory_id", null: false
    t.index ["productCategory_id"], name: "index_products_on_productCategory_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.decimal "totalValue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: ""
    t.string "name", null: false
    t.string "cpf"
    t.date "birthday"
    t.decimal "salary"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id", null: false
    t.integer "address_id", null: false
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "items", "products"
  add_foreign_key "items", "purchases"
  add_foreign_key "products", "product_categories", column: "productCategory_id"
  add_foreign_key "users", "addresses"
  add_foreign_key "users", "roles"
end
