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

ActiveRecord::Schema[7.2].define(version: 2024_10_21_133219) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "category_array", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image_url"
  end

  create_table "logs", force: :cascade do |t|
    t.bigint "workout_id", null: false
    t.bigint "split_exercise_id", null: false
    t.decimal "weight"
    t.integer "repetitions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["split_exercise_id"], name: "index_logs_on_split_exercise_id"
    t.index ["workout_id"], name: "index_logs_on_workout_id"
  end

  create_table "programmes", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.integer "weeks"
    t.integer "splits_per_week"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_programmes_on_user_id"
  end

  create_table "split_exercises", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.bigint "split_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_split_exercises_on_exercise_id"
    t.index ["split_id"], name: "index_split_exercises_on_split_id"
  end

  create_table "splits", force: :cascade do |t|
    t.bigint "programme_id", null: false
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["programme_id"], name: "index_splits_on_programme_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.decimal "weight"
    t.decimal "height"
    t.date "date_of_birth"
    t.string "gender"
    t.string "fitness_level"
    t.string "fitness_goal"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workouts", force: :cascade do |t|
    t.bigint "split_id", null: false
    t.date "date"
    t.boolean "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["split_id"], name: "index_workouts_on_split_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "logs", "split_exercises"
  add_foreign_key "logs", "workouts"
  add_foreign_key "programmes", "users"
  add_foreign_key "split_exercises", "exercises"
  add_foreign_key "split_exercises", "splits"
  add_foreign_key "splits", "programmes"
  add_foreign_key "workouts", "splits"
end
