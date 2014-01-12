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

ActiveRecord::Schema.define(version: 20140112071852) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consumer_contacts", force: true do |t|
    t.string   "street_address_1"
    t.string   "street_address_2"
    t.string   "postcode"
    t.string   "phone_number"
    t.boolean  "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "consumer_contacts", ["user_id"], name: "index_consumer_contacts_on_user_id", using: :btree

  create_table "service_contacts", force: true do |t|
    t.string   "street_address_1"
    t.string   "street_address_2"
    t.string   "postcode"
    t.string   "landline_number"
    t.string   "mobile_number"
    t.string   "fax_number"
    t.string   "website"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "business_name"
  end

  add_index "service_contacts", ["user_id"], name: "index_service_contacts_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.integer  "user_type"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
