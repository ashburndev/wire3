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

ActiveRecord::Schema[7.0].define(version: 2022_06_02_104651) do
  create_table "attachments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "file_name"
    t.string "title"
    t.boolean "visible"
    t.bigint "position"
    t.bigint "file_size"
    t.string "caption", limit: 1000
    t.string "type"
    t.bigint "document_id", null: false
    t.bigint "binary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["binary_id"], name: "index_attachments_on_binary_id"
    t.index ["document_id"], name: "index_attachments_on_document_id"
  end

  create_table "binaries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.binary "data"
    t.boolean "searchable"
    t.bigint "document_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_binaries_on_document_id"
  end

  create_table "carrier_wave_files", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.binary "data"
    t.string "identifier"
    t.string "original_filename"
    t.string "content_type"
    t.string "extension"
    t.bigint "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "body"
    t.string "classification"
    t.string "classification_xml", limit: 4000
    t.bigint "document_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_comments_on_document_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "digested_data", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.binary "data"
    t.string "md5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "document_countries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "code", limit: 5
    t.bigint "document_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_document_countries_on_document_id"
  end

  create_table "document_non_state_actors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "document_id", null: false
    t.bigint "non_state_actor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_document_non_state_actors_on_document_id"
    t.index ["non_state_actor_id"], name: "index_document_non_state_actors_on_non_state_actor_id"
  end

  create_table "document_topics", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "code", limit: 5
    t.bigint "document_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_document_topics_on_document_id"
  end

  create_table "documents", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", limit: 4000
    t.string "summary", limit: 4000
    t.string "doc_num", limit: 100
    t.string "image_caption", limit: 1000
    t.string "type", limit: 20
    t.boolean "has_attachments"
    t.boolean "worldwide"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "filedrop_ng_uploaded_file_binaries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.binary "data"
    t.bigint "part"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "non_state_actors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 4000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pdf_books", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.binary "data"
    t.string "state", limit: 30
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pdf_books_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "organization"
    t.string "dn", limit: 500
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visual_media_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attachments", "binaries"
  add_foreign_key "attachments", "documents"
  add_foreign_key "binaries", "documents"
  add_foreign_key "comments", "documents"
  add_foreign_key "comments", "users"
  add_foreign_key "document_countries", "documents"
  add_foreign_key "document_non_state_actors", "documents"
  add_foreign_key "document_non_state_actors", "non_state_actors"
  add_foreign_key "document_topics", "documents"
  add_foreign_key "pdf_books", "users"
end
