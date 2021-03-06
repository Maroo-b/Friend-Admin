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

ActiveRecord::Schema.define(version: 20170517084321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "user"
    t.string "account_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "server_id"
    t.binary "password"
    t.binary "iv"
    t.index ["server_id"], name: "index_accounts_on_server_id"
  end

  create_table "ip_addresses", force: :cascade do |t|
    t.string "ip"
    t.string "network_address"
    t.string "gateway"
    t.integer "address_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "server_id"
    t.string "network_mask"
    t.index ["server_id"], name: "index_ip_addresses_on_server_id"
  end

  create_table "servers", force: :cascade do |t|
    t.string "name"
    t.string "cpu"
    t.string "drive"
    t.string "ram"
    t.string "os"
    t.string "os_type"
    t.string "applications"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accounts", "servers"
  add_foreign_key "ip_addresses", "servers"
end
