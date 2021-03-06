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

ActiveRecord::Schema[7.0].define(version: 2022_07_27_233339) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.string "deliver_address", default: "", null: false
    t.integer "quantity", default: 1, null: false
    t.decimal "total_price", default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_transaction_id", null: false
    t.index ["store_transaction_id"], name: "index_carts_on_store_transaction_id"
  end

  create_table "favorite_foods", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.decimal "price", default: "0.0", null: false
    t.string "category", default: "", null: false
    t.string "description", default: "", null: false
    t.integer "like", default: 0, null: false
    t.boolean "is_available", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_customer_id", null: false
    t.index ["store_customer_id"], name: "index_favorite_foods_on_store_customer_id"
  end

  create_table "food_orders", force: :cascade do |t|
    t.string "food_name", default: "", null: false
    t.string "food_category", default: "", null: false
    t.integer "quantity", default: 1, null: false
    t.decimal "price", default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cart_id", null: false
    t.index ["cart_id"], name: "index_food_orders_on_cart_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.decimal "price", default: "0.0", null: false
    t.string "category", default: "", null: false
    t.string "description", default: "", null: false
    t.integer "like", default: 0, null: false
    t.decimal "discount", default: "0.0", null: false
    t.boolean "is_available", default: true, null: false
    t.string "picture"
    t.string "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id", null: false
    t.index ["store_id"], name: "index_foods_on_store_id"
  end

  create_table "personal_discounts", force: :cascade do |t|
    t.datetime "valid_date", default: "2022-07-29 09:02:58", null: false
    t.decimal "discount", default: "0.0", null: false
    t.string "food_name", default: "", null: false
    t.string "food_category", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_customer_id", null: false
    t.index ["store_customer_id"], name: "index_personal_discounts_on_store_customer_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "text_body", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "food_id", null: false
    t.bigint "store_customer_id", null: false
    t.index ["food_id"], name: "index_reviews_on_food_id"
    t.index ["store_customer_id"], name: "index_reviews_on_store_customer_id"
  end

  create_table "store_admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "role", default: "store_admin", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti"
    t.index ["email"], name: "index_store_admins_on_email", unique: true
    t.index ["jti"], name: "index_store_admins_on_jti"
    t.index ["reset_password_token"], name: "index_store_admins_on_reset_password_token", unique: true
  end

  create_table "store_customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "role", default: "store_customer", null: false
    t.boolean "is_ban", default: false, null: false
    t.integer "warning", default: 0, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti"
    t.bigint "store_id", null: false
    t.index ["confirmation_token"], name: "index_store_customers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_store_customers_on_email", unique: true
    t.index ["jti"], name: "index_store_customers_on_jti"
    t.index ["reset_password_token"], name: "index_store_customers_on_reset_password_token", unique: true
    t.index ["store_id"], name: "index_store_customers_on_store_id"
  end

  create_table "store_transactions", force: :cascade do |t|
    t.string "status", default: "pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_customer_id", null: false
    t.bigint "store_id", null: false
    t.index ["store_customer_id"], name: "index_store_transactions_on_store_customer_id"
    t.index ["store_id"], name: "index_store_transactions_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "line1", default: "", null: false
    t.string "line2", default: "", null: false
    t.string "postal_code", default: "", null: false
    t.string "city", default: "", null: false
    t.string "province", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_admin_id", null: false
    t.index ["store_admin_id"], name: "index_stores_on_store_admin_id"
  end

  add_foreign_key "carts", "store_transactions"
  add_foreign_key "favorite_foods", "store_customers"
  add_foreign_key "food_orders", "carts"
  add_foreign_key "foods", "stores"
  add_foreign_key "personal_discounts", "store_customers"
  add_foreign_key "reviews", "foods"
  add_foreign_key "reviews", "store_customers"
  add_foreign_key "store_customers", "stores"
  add_foreign_key "store_transactions", "store_customers"
  add_foreign_key "store_transactions", "stores"
  add_foreign_key "stores", "store_admins"
end
