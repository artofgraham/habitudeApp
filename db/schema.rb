# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_09_144338) do
  create_table "challenges", force: :cascade do |t|
    t.date "cdate"
    t.string "name"
    t.boolean "check"
    t.integer "position"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_challenges_on_user_id"
  end

  create_table "not_to_dos", force: :cascade do |t|
    t.date "listdate"
    t.boolean "done"
    t.string "name"
    t.integer "position"
    t.string "priority"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_not_to_dos_on_user_id"
  end

  create_table "trackers", force: :cascade do |t|
    t.date "habitdate"
    t.string "title"
    t.string "score"
    t.string "intention"
    t.decimal "total"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "day1"
    t.boolean "day2"
    t.boolean "day3"
    t.boolean "day4"
    t.boolean "day5"
    t.boolean "day6"
    t.boolean "day7"
    t.boolean "day8"
    t.boolean "day9"
    t.boolean "day10"
    t.boolean "day11"
    t.boolean "day12"
    t.boolean "day13"
    t.boolean "day14"
    t.boolean "day15"
    t.boolean "day16"
    t.boolean "day17"
    t.boolean "day18"
    t.boolean "day19"
    t.boolean "day20"
    t.boolean "day21"
    t.boolean "day22"
    t.boolean "day23"
    t.boolean "day24"
    t.boolean "day25"
    t.boolean "day26"
    t.boolean "day27"
    t.boolean "day28"
    t.boolean "day29"
    t.boolean "day30"
    t.boolean "day31"
    t.index ["user_id"], name: "index_trackers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "challenges", "users"
  add_foreign_key "not_to_dos", "users"
  add_foreign_key "trackers", "users"
end
