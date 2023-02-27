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

ActiveRecord::Schema[7.0].define(version: 2023_02_27_155055) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arts", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "visits_id"
    t.bigint "gallery_id"
    t.string "artist_display"
    t.string "image_id"
    t.boolean "is_on_view"
    t.index ["gallery_id"], name: "index_arts_on_gallery_id"
    t.index ["visits_id"], name: "index_arts_on_visits_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.bigint "viewer_id"
    t.string "title"
    t.string "description"
    t.bigint "art_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.index ["art_id"], name: "index_galleries_on_art_id"
    t.index ["viewer_id"], name: "index_galleries_on_viewer_id"
  end

  create_table "viewers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.integer "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "viewer_id", null: false
    t.date "date"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "art_id"
    t.index ["art_id"], name: "index_visits_on_art_id"
    t.index ["viewer_id"], name: "index_visits_on_viewer_id"
  end

  add_foreign_key "visits", "viewers"
end
