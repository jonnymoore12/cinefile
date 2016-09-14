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

ActiveRecord::Schema.define(version: 20160914153054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cinefiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "cinefiles", ["user_id"], name: "index_cinefiles_on_user_id", using: :btree

  create_table "cinemas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "address"
    t.string   "postcode"
    t.string   "phone"
    t.string   "website"
  end

  create_table "films", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "tmdb_id"
    t.string   "release_year"
    t.string   "poster_path"
  end

  create_table "list_films", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "cinefile_id"
    t.integer  "film_id"
  end

  add_index "list_films", ["cinefile_id"], name: "index_list_films_on_cinefile_id", using: :btree
  add_index "list_films", ["film_id"], name: "index_list_films_on_film_id", using: :btree

  create_table "screenings", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "film_id"
    t.integer  "cinema_id"
    t.date     "screen_date"
    t.time     "screen_time"
  end

  add_index "screenings", ["cinema_id"], name: "index_screenings_on_cinema_id", using: :btree
  add_index "screenings", ["film_id"], name: "index_screenings_on_film_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "cinefiles", "users"
  add_foreign_key "list_films", "cinefiles"
  add_foreign_key "list_films", "films"
  add_foreign_key "screenings", "cinemas"
  add_foreign_key "screenings", "films"
end
