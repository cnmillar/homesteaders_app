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

ActiveRecord::Schema.define(version: 20150710015144) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "video_time"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"

  create_table "galleries", force: true do |t|
    t.string   "original_image"
    t.string   "resized_image"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "shopify_id"
    t.integer  "unit_size"
    t.string   "unit_measure"
    t.boolean  "availability"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "video"
    t.integer  "difficulty"
    t.float    "batch_size"
    t.string   "batch_unit"
    t.float    "avg_rating"
    t.integer  "kit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", force: true do |t|
    t.integer  "ordinal"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_projects", force: true do |t|
    t.integer  "users_id"
    t.integer  "projects_id"
    t.boolean  "favourited"
    t.boolean  "completed"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_projects", ["projects_id"], name: "index_user_projects_on_projects_id"
  add_index "user_projects", ["users_id"], name: "index_user_projects_on_users_id"

  create_table "users", force: true do |t|
    t.boolean  "admin",      default: false
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
