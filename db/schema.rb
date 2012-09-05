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

ActiveRecord::Schema.define(:version => 20120904060406) do

  create_table "lbdds", :force => true do |t|
    t.string   "ticket_num"
    t.string   "company_name"
    t.string   "company_contact"
    t.integer  "flag"
    t.string   "status"
    t.string   "section"
    t.integer  "price"
    t.string   "approved"
    t.string   "paid"
    t.integer  "user_id"
    t.string   "main_section"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "company_email"
  end

  add_index "lbdds", ["user_id"], :name => "index_lbdds_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "company_name"
    t.string   "company_contact"
    t.string   "company_email"
    t.integer  "flag",            :default => 0
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "vipbbsrsbbs", :force => true do |t|
    t.string   "ticket_num"
    t.string   "company_name"
    t.string   "company_contact"
    t.string   "company_email"
    t.integer  "flag"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "status",          :default => false
    t.string   "section"
    t.string   "price"
    t.string   "approved"
    t.string   "paid"
    t.integer  "user_id"
    t.string   "main_section"
  end

  add_index "vipbbsrsbbs", ["user_id"], :name => "index_vipbbsrsbbs_on_user_id"

end
