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

ActiveRecord::Schema.define(version: 20151110115710) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true

  create_table "applies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.string   "message"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "applies", ["campaign_id"], name: "index_applies_on_campaign_id"
  add_index "applies", ["user_id", "campaign_id"], name: "index_applies_on_user_id_and_campaign_id"
  add_index "applies", ["user_id"], name: "index_applies_on_user_id"

  create_table "brunches", force: :cascade do |t|
    t.string   "brunchname"
    t.string   "brunchnamefurigana"
    t.string   "brunch_postel01"
    t.string   "brunch_postel02"
    t.string   "brunch_address01"
    t.string   "brunch_address02"
    t.string   "brunch_address03"
    t.string   "brunch_address04"
    t.string   "brunch_station"
    t.string   "brunch_tel"
    t.string   "brunch_fax"
    t.string   "brunch_staffname"
    t.string   "brunch_staffnamefurigana"
    t.string   "brunch_staffemail"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "client_id"
  end

  add_index "brunches", ["client_id", "created_at"], name: "index_brunches_on_client_id_and_created_at"
  add_index "brunches", ["client_id"], name: "index_brunches_on_client_id"

  create_table "campaigns", force: :cascade do |t|
    t.integer  "client_id"
    t.text     "title"
    t.text     "summary"
    t.text     "content"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
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
    t.text     "jobtitle01"
    t.text     "jobtitle02"
    t.text     "jobtitle03"
    t.text     "auth"
    t.text     "office_name"
    t.text     "office_postel"
    t.text     "office_address01"
    t.text     "office_address02"
    t.text     "office_address03"
    t.text     "office_address04"
    t.text     "mycar"
    t.text     "station"
    t.text     "mapinfo"
    t.text     "koyokeitai"
    t.text     "koyokikan"
    t.text     "salary"
    t.text     "salary_remarks"
    t.text     "socialsecurity"
    t.text     "commuting_expenses"
    t.text     "promote"
    t.text     "retirement_salary"
    t.text     "allowance"
    t.text     "emp_remarks"
    t.text     "worktime"
    t.text     "breaktime"
    t.text     "overtime"
    t.text     "holiday"
    t.text     "annual_holiday"
    t.text     "job_description"
    t.text     "workflow"
    t.text     "licence"
    t.text     "skill"
    t.text     "qualification"
    t.text     "age_criteria"
    t.text     "in_charge"
    t.text     "apply_tel"
    t.text     "apply_email"
    t.text     "apply_how"
    t.text     "apply_flow"
    t.text     "apply_remarks"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "officeaddress"
    t.text     "office_postel02"
    t.text     "howmany"
    t.text     "shouyo"
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
    t.text     "genre1"
    t.text     "genre2"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "compname"
    t.string   "membername"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "compnamefurigana"
    t.text     "honsya_postel"
    t.text     "honsya_postel02"
    t.text     "honsya_address01"
    t.text     "honsya_address02"
    t.text     "honsya_address03"
    t.text     "honsya_address04"
    t.text     "honsya_tel"
    t.text     "honsya_fax"
    t.text     "honsya_url"
    t.text     "daihyou"
    t.text     "since"
    t.text     "capital"
    t.text     "employee"
    t.text     "gyousyu"
    t.text     "business"
    t.text     "bikou"
    t.text     "membernamefurigana"
    t.text     "section"
    t.text     "position"
    t.text     "membercomp"
    t.text     "memberpostel"
    t.text     "memberpostel02"
    t.text     "memberaddress01"
    t.text     "memberaddress02"
    t.text     "memberaddress03"
    t.text     "memberaddress04"
    t.text     "membertel"
    t.text     "memberfax"
    t.text     "agreeflg"
  end

  add_index "clients", ["email"], name: "index_clients_on_email", unique: true

  create_table "rescats", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "resume_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "rescats", ["category_id"], name: "index_rescats_on_category_id"
  add_index "rescats", ["resume_id"], name: "index_rescats_on_resume_id"

  create_table "resumes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "user_address01"
    t.string   "user_address02"
    t.string   "tel"
    t.date     "birthday"
    t.string   "sex"
    t.string   "shikaku"
    t.string   "menkyo"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.text     "user_address03"
    t.text     "user_address04"
    t.text     "user_postel01"
    t.text     "user_postel02"
    t.text     "tel02"
    t.text     "gradyear"
    t.text     "gradschool"
    t.text     "status"
    t.text     "jikopr"
    t.text     "graduateyear"
    t.text     "skills"
    t.text     "wannabe"
    t.text     "scoutflg"
    t.text     "jobhopcount"
    t.text     "jobhistorycompname01"
    t.text     "jobhistorystartdate01"
    t.text     "jobhistoryenddate01"
    t.text     "jobhistorykeitai01"
    t.text     "jobhistoryoccupation01"
    t.text     "jobhistory01"
    t.text     "jobhistorycompname02"
    t.text     "jobhistorystartdate02"
    t.text     "jobhistoryenddate02"
    t.text     "jobhistorykeitai02"
    t.text     "jobhistoryoccupation02"
    t.text     "jobhistory02"
    t.text     "jobhistorycompname03"
    t.text     "jobhistorystartdate03"
    t.text     "jobhistoryenddate03"
    t.text     "jobhistorykeitai03"
    t.text     "jobhistoryoccupation03"
    t.text     "jobhistory03"
    t.text     "skillexperience"
  end

  add_index "resumes", ["user_id"], name: "index_resumes_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "namaefurigana"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
