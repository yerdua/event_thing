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

ActiveRecord::Schema.define(:version => 20130709212047) do

  create_table "artists", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "artists", ["name"], :name => "index_artists_on_name"

  create_table "cities", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "country_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cities", ["country_id"], :name => "index_cities_on_country_id"
  add_index "cities", ["name"], :name => "index_cities_on_name"

  create_table "countries", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "countries", ["name"], :name => "index_countries_on_name"

  create_table "events", :force => true do |t|
    t.string   "title",       :null => false
    t.text     "description"
    t.integer  "venue_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "owner_id"
  end

  add_index "events", ["owner_id"], :name => "index_events_on_owner_id"
  add_index "events", ["title"], :name => "index_events_on_title"
  add_index "events", ["venue_id"], :name => "index_events_on_venue_id"

  create_table "users", :force => true do |t|
    t.string   "username",        :null => false
    t.string   "password_digest", :null => false
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "home_city_id"
    t.string   "session_token"
  end

  add_index "users", ["home_city_id"], :name => "index_users_on_home_city_id"
  add_index "users", ["session_token"], :name => "index_users_on_session_token"
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "venues", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "venues", ["name"], :name => "index_venues_on_name"

end
