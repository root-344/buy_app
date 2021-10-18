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

ActiveRecord::Schema.define(version: 2021_10_18_164257) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "zip", null: false
    t.integer "region_id", null: false
    t.string "city", null: false
    t.string "house_number", null: false
    t.string "building_number"
    t.string "phone", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_addresses_on_order_id"
  end

  create_table "farms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "first_name_kana", default: "", null: false
    t.string "last_name_kana", default: "", null: false
    t.string "nickname", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_farms_on_email", unique: true
    t.index ["reset_password_token"], name: "index_farms_on_reset_password_token", unique: true
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "product", null: false
    t.bigint "farm_id", null: false
    t.text "description"
    t.integer "category_id", null: false
    t.integer "states_id", null: false
    t.integer "shipping_fee_id", null: false
    t.integer "region_id", null: false
    t.integer "eta_id", null: false
    t.integer "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["farm_id"], name: "index_items_on_farm_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_orders_on_item_id"
    t.index ["store_id"], name: "index_orders_on_store_id"
  end

  create_table "stores", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "first_name_kana", default: "", null: false
    t.string "last_name_kana", default: "", null: false
    t.string "nickname", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_stores_on_email", unique: true
    t.index ["reset_password_token"], name: "index_stores_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "orders"
  add_foreign_key "items", "farms"
  add_foreign_key "orders", "items"
  add_foreign_key "orders", "stores"
end
