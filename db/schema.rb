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

ActiveRecord::Schema[8.0].define(version: 2025_01_25_153727) do
  create_table "answers", force: :cascade do |t|
    t.string "username", null: false # 選択肢を作成したユーザーの名前
    t.text "description", null: false # 選択肢の内容
    t.integer "like", default: 0 # 選択肢の投票数
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "question_id", null: false # 親のアンケート(Question)のid
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "username", null: false # アンケートを作成性たユーザーの名前
    t.string "description", null: false # アンケートの質問内容
    t.datetime "created_at", null: false 
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "questions"
end
