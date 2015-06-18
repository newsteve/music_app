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

ActiveRecord::Schema.define(version: 20150618214415) do

  create_table "albums", force: true do |t|
    t.integer  "band_id",    null: false
    t.string   "style_type", null: false
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["band_id"], name: "index_albums_on_band_id"
  add_index "albums", ["style_type"], name: "index_albums_on_style_type"
  add_index "albums", ["title"], name: "index_albums_on_title"

  create_table "bands", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bands", ["name"], name: "index_bands_on_name", unique: true

  create_table "notes", force: true do |t|
    t.integer  "track_id",    null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "track_notes"
  end

  add_index "notes", ["track_id"], name: "index_notes_on_track_id"
  add_index "notes", ["user_id"], name: "index_notes_on_user_id"

  create_table "tracks", force: true do |t|
    t.integer  "album_id",    null: false
    t.string   "song_type",   null: false
    t.text     "lyrics"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "track_title"
  end

  add_index "tracks", ["album_id"], name: "index_tracks_on_album_id"
  add_index "tracks", ["song_type"], name: "index_tracks_on_song_type"

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true

end
