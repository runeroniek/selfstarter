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

ActiveRecord::Schema.define(:version => 20130101194612) do

  create_table "orders", :force => true do |t|
    t.integer  "user_id",                     :null => false
    t.integer  "project_id",                  :null => false
    t.decimal  "value",      :default => 0.0
    t.string   "token"
    t.string   "status"
    t.string   "uuid"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "orders", ["project_id"], :name => "index_orders_on_project_id"
  add_index "orders", ["token"], :name => "index_orders_on_token", :unique => true
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"
  add_index "orders", ["uuid"], :name => "index_orders_on_uuid"

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "expiration_date"
    t.decimal  "goal"
    t.string   "image"
    t.string   "video"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "cpf"
    t.date     "birthday"
    t.string   "address_street"
    t.string   "address_street_extra"
    t.string   "address_street_number"
    t.string   "address_neighbourhood"
    t.string   "address_city"
    t.string   "address_state"
    t.string   "address_country"
    t.string   "address_cep"
    t.string   "address_phone"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end
