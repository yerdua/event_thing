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

ActiveRecord::Schema.define(:version => 20130712170004) do

  create_table "artists", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "artists", ["name"], :name => "index_artists_on_name"

  create_table "events", :force => true do |t|
    t.string   "title",       :null => false
    t.text     "description"
    t.integer  "venue_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "owner_id"
    t.datetime "start_time",  :null => false
    t.datetime "end_time",    :null => false
    t.string   "url"
  end

  add_index "events", ["owner_id"], :name => "index_events_on_owner_id"
  add_index "events", ["start_time"], :name => "index_events_on_start_time"
  add_index "events", ["title"], :name => "index_events_on_title"
  add_index "events", ["venue_id"], :name => "index_events_on_venue_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "taggings", ["event_id"], :name => "index_taggings_on_event_id"
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username",        :null => false
    t.string   "password_digest", :null => false
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "session_token"
  end

  add_index "users", ["session_token"], :name => "index_users_on_session_token"
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "venues", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "state_code"
    t.string   "url"
  end

  add_index "venues", ["name"], :name => "index_venues_on_name"

end
