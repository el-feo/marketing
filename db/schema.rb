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

ActiveRecord::Schema.define(version: 20140624173805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "leads", force: true do |t|
    t.string   "phase"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "title"
    t.string   "email"
    t.string   "domain"
    t.string   "city"
    t.string   "category_1"
    t.string   "category_2"
    t.string   "category_3"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "campaign"
    t.date     "campaign_date"
  end

  add_index "leads", ["city"], name: "index_leads_on_city", using: :btree
  add_index "leads", ["company_name"], name: "index_leads_on_company_name", using: :btree
  add_index "leads", ["email"], name: "index_leads_on_email", unique: true, using: :btree
  add_index "leads", ["phase"], name: "index_leads_on_phase", using: :btree
  add_index "leads", ["title"], name: "index_leads_on_title", using: :btree

end
