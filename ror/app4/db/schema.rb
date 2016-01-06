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

ActiveRecord::Schema.define(version: 20160105135115) do

  create_table "danees", force: :cascade do |t|
    t.integer  "userr_id"
    t.string   "immie"
    t.string   "nazwisko"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "danes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "imie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "danes", ["user_id"], name: "index_danes_on_user_id"

  create_table "grupies", force: :cascade do |t|
    t.integer  "wykladowca_id"
    t.text     "nazwa"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "grupies", ["wykladowca_id"], name: "index_grupies_on_wykladowca_id"

  create_table "progres", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "pkt_rankingowe"
    t.integer  "zdrowie"
    t.integer  "doswiadczenie"
    t.integer  "level"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "progres", ["student_id"], name: "index_progres_on_student_id"

  create_table "rozwiazania", force: :cascade do |t|
    t.integer  "wykladowca_id"
    t.integer  "student_id"
    t.text     "tresc_zadania"
    t.text     "odpowiedz"
    t.integer  "przeczytana"
    t.date     "data"
    t.time     "godzina"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "rozwiazania", ["student_id"], name: "index_rozwiazania_on_student_id"
  add_index "rozwiazania", ["wykladowca_id"], name: "index_rozwiazania_on_wykladowca_id"

  create_table "students", force: :cascade do |t|
    t.string   "login"
    t.string   "haslo"
    t.string   "kontakt"
    t.string   "imie"
    t.string   "nazwisko"
    t.string   "nralbumu"
    t.integer  "grupy_id"
    t.integer  "nr_logowania"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "students", ["grupy_id"], name: "index_students_on_grupy_id"
  add_index "students", ["login"], name: "index_students_on_login", unique: true

  create_table "userrs", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.date     "register_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.date     "register_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "wiadomoscis", force: :cascade do |t|
    t.integer  "wykladowca_id"
    t.integer  "student_id"
    t.text     "tresc"
    t.integer  "przeczytana"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "wiadomoscis", ["student_id"], name: "index_wiadomoscis_on_student_id"
  add_index "wiadomoscis", ["wykladowca_id"], name: "index_wiadomoscis_on_wykladowca_id"

  create_table "wykladowcas", force: :cascade do |t|
    t.string   "imie"
    t.string   "nazwisko"
    t.string   "login"
    t.string   "haslo"
    t.string   "kontakt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wykladowcas", ["login"], name: "index_wykladowcas_on_login", unique: true

  create_table "zadania_glownes", force: :cascade do |t|
    t.integer  "wykladowca_id"
    t.integer  "poziom_zadania"
    t.integer  "nr_zadania"
    t.integer  "pkt_za_zadanie"
    t.text     "tresc"
    t.text     "podpowiedz"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "zadania_glownes", ["wykladowca_id"], name: "index_zadania_glownes_on_wykladowca_id"

  create_table "zadania_pobocznes", force: :cascade do |t|
    t.integer  "wykladowca_id"
    t.integer  "grupy_id"
    t.integer  "poziom_zadania"
    t.text     "tresc"
    t.text     "podpowiedz"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "zadania_pobocznes", ["grupy_id"], name: "index_zadania_pobocznes_on_grupy_id"
  add_index "zadania_pobocznes", ["wykladowca_id"], name: "index_zadania_pobocznes_on_wykladowca_id"

end
