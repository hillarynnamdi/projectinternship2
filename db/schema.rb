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

ActiveRecord::Schema.define(version: 20150925180558) do

  create_table "clients", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "gender"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
    t.integer  "user_id"
    t.boolean  "archived",     default: false
  end

  add_index "clients", ["client_id"], name: "index_clients_on_client_id"
  add_index "clients", ["user_id"], name: "index_clients_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "company_name"
    t.string   "company_address"
    t.string   "company_city"
    t.string   "company_state"
    t.string   "company_country"
    t.string   "company_email"
    t.string   "company_phone"
    t.boolean  "account_activated",    default: false
    t.string   "activation_token"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.string   "forgot_token"
    t.datetime "forgot_token_sent_at"
    t.string   "image"
  end

end
