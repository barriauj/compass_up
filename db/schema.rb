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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131105185205) do

  create_table "ais_application_comments", :force => true do |t|
    t.string   "banner_pidm"
    t.string   "application_term"
    t.integer  "application_number"
    t.string   "originator"
    t.text     "comment"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "ais_attributes", :force => true do |t|
    t.string   "banner_pidm"
    t.string   "application_term"
    t.string   "application_number"
    t.string   "name"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "ais_checklists", :force => true do |t|
    t.string   "banner_pidm"
    t.string   "application_term"
    t.integer  "application_number"
    t.string   "requirement_code"
    t.string   "received_date"
    t.string   "item"
    t.string   "item_description"
    t.string   "ckst_code"
    t.string   "mandatory"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "ais_terms", :force => true do |t|
    t.date     "effective_on"
    t.string   "spring"
    t.string   "summer"
    t.string   "fall"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
