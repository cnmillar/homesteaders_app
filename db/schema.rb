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

ActiveRecord::Schema.define(version: 20150714192332) do

  create_table "average_caches", force: true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "images", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "original"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["project_id"], name: "index_images_on_project_id"
  add_index "images", ["user_id"], name: "index_images_on_user_id"

  create_table "ingredients", force: true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.string   "ing_type"
    t.integer  "shopify_id"
    t.float    "unit_size"
    t.string   "unit_measure"
    t.boolean  "availability"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shopify_unit"
  end

  add_index "ingredients", ["project_id"], name: "index_ingredients_on_project_id"

  create_table "overall_averages", force: true do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.integer  "category_id"
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
    t.integer  "duration"
    t.string   "duration_unit"
  end

  add_index "projects", ["category_id"], name: "index_projects_on_category_id"

  create_table "rates", force: true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id"

  create_table "rating_caches", force: true do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"

  create_table "steps", force: true do |t|
    t.integer  "project_id"
    t.integer  "ordinal"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "steps", ["project_id"], name: "index_steps_on_project_id"

  create_table "user_projects", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.boolean  "favourited"
    t.boolean  "completed"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_projects", ["project_id"], name: "index_user_projects_on_project_id"
  add_index "user_projects", ["user_id"], name: "index_user_projects_on_user_id"

  create_table "users", force: true do |t|
    t.integer  "facebook_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "avatar"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.integer  "project_id"
    t.string   "url"
    t.string   "title"
    t.string   "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["project_id"], name: "index_videos_on_project_id"

end
