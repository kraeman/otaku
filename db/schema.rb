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

ActiveRecord::Schema.define(version: 2021_04_06_171632) do

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.date "dob"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "actors_shows", force: :cascade do |t|
    t.integer "actor_id", null: false
    t.integer "show_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actor_id"], name: "index_actors_shows_on_actor_id"
    t.index ["show_id"], name: "index_actors_shows_on_show_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.integer "show_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "actor_id", null: false
    t.index ["actor_id"], name: "index_characters_on_actor_id"
    t.index ["show_id"], name: "index_characters_on_show_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "show_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["show_id"], name: "index_comments_on_show_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string "title"
    t.integer "air_time"
    t.decimal "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.date "dob"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.string "uid"
    t.string "image"
    t.boolean "cvo", default: false
  end

  create_table "viewings", force: :cascade do |t|
    t.datetime "time"
    t.string "place"
    t.integer "show_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["show_id"], name: "index_viewings_on_show_id"
    t.index ["user_id"], name: "index_viewings_on_user_id"
  end

  add_foreign_key "actors_shows", "actors"
  add_foreign_key "actors_shows", "shows"
  add_foreign_key "characters", "actors"
  add_foreign_key "characters", "shows"
  add_foreign_key "comments", "shows"
  add_foreign_key "viewings", "shows"
  add_foreign_key "viewings", "users"
end
