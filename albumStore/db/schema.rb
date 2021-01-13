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

ActiveRecord::Schema.define(version: 2021_01_11_161050) do

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.string "pic"
    t.string "description"
    t.decimal "price"
    t.decimal "sales"
    t.decimal "stock"
    t.integer "region_id"
    t.integer "genre_id"
    t.integer "musician_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_albums_on_genre_id"
    t.index ["musician_id"], name: "index_albums_on_musician_id"
    t.index ["region_id"], name: "index_albums_on_region_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "album_id"
    t.integer "user_id"
    t.decimal "price"
    t.decimal "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_carts_on_album_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "album_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_favorites_on_album_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "musicians", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_items", force: :cascade do |t|
    t.integer "album_id"
    t.integer "user_id"
    t.decimal "price"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "transactionOrder_id"
    t.index ["album_id"], name: "index_transaction_items_on_album_id"
    t.index ["transactionOrder_id"], name: "index_transaction_items_on_transactionOrder_id"
    t.index ["user_id"], name: "index_transaction_items_on_user_id"
  end

  create_table "transaction_orders", force: :cascade do |t|
    t.integer "transaction_item_id"
    t.integer "user_id"
    t.string "delivery_name"
    t.string "delivery_address"
    t.integer "delivery_phone"
    t.integer "delivery_postcode"
    t.string "delivery_state"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "transactionItems_id"
    t.index ["transactionItems_id"], name: "index_transaction_orders_on_transactionItems_id"
    t.index ["transaction_item_id"], name: "index_transaction_orders_on_transaction_item_id"
    t.index ["user_id"], name: "index_transaction_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "role"
    t.string "email"
    t.decimal "money"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
