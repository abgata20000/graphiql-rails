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

ActiveRecord::Schema.define(version: 2021_10_20_233357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name", null: false, comment: "名前"
    t.text "description", null: false, comment: "詳細"
    t.integer "status", default: 0, null: false, comment: "ステータス"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_authors_on_name"
    t.index ["status"], name: "index_authors_on_status"
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false, comment: "タイトル"
    t.text "description", null: false, comment: "詳細"
    t.datetime "released_at", comment: "発売日"
    t.integer "price", default: 0, null: false, comment: "価格"
    t.integer "status", default: 0, null: false, comment: "ステータス"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status"], name: "index_books_on_status"
    t.index ["title"], name: "index_books_on_title"
  end

  create_table "rl_book_authors", force: :cascade do |t|
    t.bigint "book_id", null: false, comment: "書籍ID"
    t.bigint "author_id", null: false, comment: "著者ID"
    t.integer "sort_key", default: 0, null: false, comment: "順番指定キー"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_rl_book_authors_on_author_id"
    t.index ["book_id", "author_id"], name: "index_rl_book_authors_on_book_id_and_author_id", unique: true
    t.index ["book_id"], name: "index_rl_book_authors_on_book_id"
    t.index ["sort_key"], name: "index_rl_book_authors_on_sort_key"
  end

  create_table "rl_book_tags", force: :cascade do |t|
    t.bigint "book_id", null: false, comment: "書籍ID"
    t.bigint "tag_id", null: false, comment: "タグID"
    t.integer "sort_key", default: 0, null: false, comment: "順番指定キー"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id", "tag_id"], name: "index_rl_book_tags_on_book_id_and_tag_id", unique: true
    t.index ["book_id"], name: "index_rl_book_tags_on_book_id"
    t.index ["sort_key"], name: "index_rl_book_tags_on_sort_key"
    t.index ["tag_id"], name: "index_rl_book_tags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false, comment: "名前"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

end
