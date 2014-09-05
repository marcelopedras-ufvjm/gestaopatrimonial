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

ActiveRecord::Schema.define(version: 20140902182336) do

  create_table "accessories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "resource_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accessories", ["category_id"], name: "index_accessories_on_category_id"
  add_index "accessories", ["resource_id"], name: "index_accessories_on_resource_id"

  create_table "buildings", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "parent_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["parent_category_id"], name: "index_categories_on_parent_category_id"

  create_table "detail_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "details", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "order"
    t.integer  "resource_id"
    t.integer  "detail_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "details", ["detail_type_id"], name: "index_details_on_detail_type_id"
  add_index "details", ["order", "resource_id"], name: "index_details_on_order_and_resource_id", unique: true
  add_index "details", ["resource_id"], name: "index_details_on_resource_id"

  create_table "event_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loans", force: true do |t|
    t.datetime "start"
    t.datetime "end"
    t.datetime "devolution_forecast"
    t.boolean  "booking"
    t.text     "observation"
    t.integer  "user_id"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "loans", ["resource_id"], name: "index_loans_on_resource_id"
  add_index "loans", ["user_id"], name: "index_loans_on_user_id"

  create_table "localizations", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "complement"
    t.integer  "building_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "localizations", ["building_id"], name: "index_localizations_on_building_id"

  create_table "resource_histories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "event_time"
    t.integer  "resource_id"
    t.integer  "event_type_id"
    t.integer  "localization_id"
    t.integer  "loan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resource_histories", ["event_type_id"], name: "index_resource_histories_on_event_type_id"
  add_index "resource_histories", ["loan_id"], name: "index_resource_histories_on_loan_id"
  add_index "resource_histories", ["localization_id"], name: "index_resource_histories_on_localization_id"
  add_index "resource_histories", ["resource_id"], name: "index_resource_histories_on_resource_id"

  create_table "resources", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.integer  "state_id"
    t.integer  "localization_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resources", ["category_id"], name: "index_resources_on_category_id"
  add_index "resources", ["localization_id"], name: "index_resources_on_localization_id"
  add_index "resources", ["state_id"], name: "index_resources_on_state_id"
  add_index "resources", ["user_id"], name: "index_resources_on_user_id"

  create_table "states", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "password"
    t.boolean  "tutor"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
