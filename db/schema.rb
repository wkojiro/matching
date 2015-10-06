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

ActiveRecord::Schema.define(version: 20151006091248) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true

  create_table "campaigns", force: :cascade do |t|
    t.integer  "client_id"
    t.text     "title"
    t.text     "summary"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "opflg"
    t.date     "startdate"
    t.date     "enddate"
    t.string   "limage"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "youtube"
    t.string   "category"
  end

  add_index "campaigns", ["client_id", "created_at"], name: "index_campaigns_on_client_id_and_created_at"
  add_index "campaigns", ["client_id"], name: "index_campaigns_on_client_id"

  create_table "campcats", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "campaign_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "campcats", ["campaign_id"], name: "index_campcats_on_campaign_id"
  add_index "campcats", ["category_id"], name: "index_campcats_on_category_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "compname"
    t.string   "membername"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "clients", ["email"], name: "index_clients_on_email", unique: true

  create_table "resumes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "address1"
    t.string   "address2"
    t.string   "tel"
    t.date     "birthday"
    t.string   "sex"
    t.string   "shikaku"
    t.string   "menkyo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "resumes", ["user_id"], name: "index_resumes_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
