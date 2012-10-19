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

ActiveRecord::Schema.define(:version => 20121013183724) do

  create_table "requests", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "zone"
    t.string   "building"
    t.string   "location_id"
    t.string   "status"
    t.string   "tag_number"
    t.text     "description"
    t.text     "reject_reason"
    t.text     "location_description"
    t.text     "item_description"
    t.datetime "accept_date"
    t.datetime "reject_date"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "area"
    t.string   "request_number"
  end

end