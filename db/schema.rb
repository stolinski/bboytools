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

ActiveRecord::Schema.define(:version => 20130820013841) do

  create_table "battles", :force => true do |t|
    t.string    "name"
    t.string    "location"
    t.date      "date"
    t.text      "results"
    t.text      "notes"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
    t.integer   "user_id"
    t.integer   "iteration"
  end

  add_index "battles", ["user_id"], :name => "index_battles_on_user_id"

  create_table "battles_users", :id => false, :force => true do |t|
    t.integer "battle_id"
    t.integer "user_id"
    t.text    "notes"
    t.text    "results"
  end

  add_index "battles_users", ["battle_id"], :name => "index_battles_users_on_battle_id"
  add_index "battles_users", ["user_id"], :name => "index_battles_users_on_user_id"

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "moves", :force => true do |t|
    t.string    "name"
    t.string    "video"
    t.integer   "user_id"
    t.timestamp "created_at",     :null => false
    t.timestamp "updated_at",     :null => false
    t.integer   "type_id"
    t.boolean   "bmode"
    t.integer   "round_id"
    t.integer   "round_position"
    t.text      "description"
    t.integer   "level"
  end

  add_index "moves", ["round_id"], :name => "index_moves_on_round_id"
  add_index "moves", ["type_id"], :name => "index_moves_on_type_id"
  add_index "moves", ["user_id"], :name => "index_moves_on_user_id"

  create_table "round_moves", :force => true do |t|
    t.integer   "round_id"
    t.integer   "move_id"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
    t.integer   "position"
  end

  add_index "round_moves", ["move_id"], :name => "index_round_moves_on_move_id"
  add_index "round_moves", ["round_id"], :name => "index_round_moves_on_round_id"

  create_table "rounds", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
    t.integer   "user_id"
  end

  add_index "rounds", ["user_id"], :name => "index_rounds_on_user_id"

  create_table "types", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
    t.integer   "row_order"
  end

  create_table "user_battles", :force => true do |t|
    t.integer   "user_id"
    t.integer   "battle_id"
    t.string    "notes"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  add_index "user_battles", ["battle_id"], :name => "index_user_battles_on_battle_id"
  add_index "user_battles", ["user_id"], :name => "index_user_battles_on_user_id"

  create_table "users", :force => true do |t|
    t.string    "first_name"
    t.string    "last_name"
    t.string    "bboy_name"
    t.string    "crew_name"
    t.string    "email",                  :default => "", :null => false
    t.string    "encrypted_password",     :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",          :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at",                             :null => false
    t.timestamp "updated_at",                             :null => false
  end

  add_index "users", ["bboy_name"], :name => "index_users_on_bboy_name", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
