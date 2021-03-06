# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160215062235) do

  create_table "addresses", force: :cascade do |t|
    t.string   "city",            limit: 255
    t.string   "district",        limit: 255
    t.string   "state",           limit: 255
    t.string   "country",         limit: 255
    t.string   "pincode",         limit: 255
    t.integer  "customer_id",     limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "deliver_address",             default: false
  end

  add_index "addresses", ["customer_id"], name: "index_addresses_on_customer_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "category_name", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "company_name", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.string   "fname",      limit: 255
    t.string   "lname",      limit: 255
    t.string   "mobile_no",  limit: 255
    t.date     "birth_date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "item_lines", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "order_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "order_no",      limit: 4
    t.integer  "tracking_no",   limit: 4
    t.date     "delivery_date"
    t.string   "order_value",   limit: 255
    t.string   "amount",        limit: 255
    t.string   "delivery_type", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "customer_id",   limit: 4
    t.integer  "address_id",    limit: 4
  end

  add_index "orders", ["address_id"], name: "index_orders_on_address_id", using: :btree
  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "category_id",        limit: 4
    t.integer  "company_id",         limit: 4
    t.string   "product_name",       limit: 255
    t.text     "description",        limit: 65535
    t.float    "price",              limit: 24
    t.integer  "quantity",           limit: 4
    t.string   "sku",                limit: 255
    t.integer  "lehgth",             limit: 4
    t.integer  "width",              limit: 4
    t.integer  "hieght",             limit: 4
    t.integer  "weight",             limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["company_id"], name: "index_products_on_company_id", using: :btree

  add_foreign_key "addresses", "customers"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "customers"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "companies"
end
