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

ActiveRecord::Schema.define(version: 20181007184018) do

  create_table "projects", force: :cascade do |t|
    t.string "project_name", default: "", null: false
    t.boolean "end", default: false, null: false
    t.string "created_by", default: "", null: false
    t.string "goal", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deadline", default: "2018-09-30 10:34:44", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.string "task"
    t.boolean "finished"
    t.decimal "min_cost", precision: 15, scale: 5
    t.decimal "max_cost", precision: 15, scale: 5
    t.integer "level"
    t.string "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.string "details"
    t.index ["project_id"], name: "index_todos_on_project_id"
  end

  create_table "user_projects", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_user_projects_on_project_id"
    t.index ["user_id", "project_id"], name: "index_user_projects_on_user_id_and_project_id", unique: true
    t.index ["user_id"], name: "index_user_projects_on_user_id"
  end

  create_table "user_todos", force: :cascade do |t|
    t.integer "user_id"
    t.integer "todo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todo_id"], name: "index_user_todos_on_todo_id"
    t.index ["user_id"], name: "index_user_todos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
