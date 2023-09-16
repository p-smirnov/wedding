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

ActiveRecord::Schema[7.0].define(version: 2023_09_16_160720) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "guests", force: :cascade do |t|
    t.text "email", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "token", null: false
    t.boolean "attending"
    t.string "diet"
    t.string "songs"
    t.string "notes"
    t.string "first_name"
    t.string "last_name"
    t.datetime "confirmed_at", precision: nil
    t.boolean "staying_overnight"
    t.boolean "dog"
    t.index ["email"], name: "index_guests_on_email", unique: true
  end

  create_table "plus_ones", force: :cascade do |t|
    t.integer "guest_id"
    t.string "diet"
    t.boolean "child"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "child_under_three"
    t.index ["guest_id"], name: "index_plus_ones_on_guest_id"
  end

  add_foreign_key "plus_ones", "guests"

  create_view "attendees", sql_definition: <<-SQL
      SELECT
    CAST(id AS TEXT),
    first_name, last_name, email,
    diet, songs, notes, NULL as child,
    updated_at
  FROM guests
  WHERE attending

  UNION ALL

  SELECT
    guest_id || '-' || plus_ones.id AS id,
    plus_ones.first_name, plus_ones.last_name, NULL AS email,
    plus_ones.diet, NULL as songs, NULL as notes, plus_ones.child,
    plus_ones.updated_at
  FROM plus_ones
  JOIN guests ON plus_ones.guest_id = guests.id
  WHERE guests.attending
  SQL
end
