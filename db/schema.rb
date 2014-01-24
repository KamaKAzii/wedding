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

ActiveRecord::Schema.define(version: 20140125010924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: true do |t|
    t.string   "title"
    t.date     "date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id", using: :btree

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

  create_table "couples", force: true do |t|
    t.integer  "marriage_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "couples", ["marriage_id"], name: "index_couples_on_marriage_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "street_address_1"
    t.string   "street_address_2"
    t.string   "postcode"
    t.datetime "date"
    t.integer  "marriage_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["marriage_id"], name: "index_events_on_marriage_id", using: :btree

  create_table "invites", force: true do |t|
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "active"
  end

  add_index "invites", ["user_id"], name: "index_invites_on_user_id", using: :btree

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "application_due_date"
    t.integer  "marriage_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["marriage_id"], name: "index_jobs_on_marriage_id", using: :btree

  create_table "marriages", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "marriages", ["user_id"], name: "index_marriages_on_user_id", using: :btree

  create_table "photos", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "body"
    t.datetime "date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

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

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.integer  "user_type"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "couple_id"
  end

  add_index "users", ["couple_id"], name: "index_users_on_couple_id", using: :btree

end
