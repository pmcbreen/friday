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

ActiveRecord::Schema.define(version: 20150819231139) do

  create_table "divisions", force: :cascade do |t|
    t.string   "div_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "divisions_offerings", force: :cascade do |t|
    t.integer "division_id"
    t.integer "offering_id"
  end

  add_index "divisions_offerings", ["division_id"], name: "index_divisions_offerings_on_division_id"
  add_index "divisions_offerings", ["offering_id"], name: "index_divisions_offerings_on_offering_id"

  create_table "grades", force: :cascade do |t|
    t.string   "grade_level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "division_id"
  end

  create_table "grades_offerings", force: :cascade do |t|
    t.integer "grade_id"
    t.integer "offering_id"
  end

  add_index "grades_offerings", ["grade_id"], name: "index_grades_offerings_on_grade_id"
  add_index "grades_offerings", ["offering_id"], name: "index_grades_offerings_on_offering_id"

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.integer  "parent_id"
  end

  create_table "offerings", force: :cascade do |t|
    t.string   "title"
    t.text     "short_desc"
    t.text     "long_desc"
    t.string   "div_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offerings_teachers", id: false, force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "offering_id"
  end

  add_index "offerings_teachers", ["offering_id"], name: "index_offerings_teachers_on_offering_id"
  add_index "offerings_teachers", ["teacher_id"], name: "index_offerings_teachers_on_teacher_id"

  create_table "parents", force: :cascade do |t|
    t.string   "first_name"
    t.text     "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teacher_offerings", id: false, force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "offering_id"
  end

  add_index "teacher_offerings", ["offering_id"], name: "index_teacher_offerings_on_offering_id"
  add_index "teacher_offerings", ["teacher_id"], name: "index_teacher_offerings_on_teacher_id"

  create_table "teachers", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "title"
    t.string   "aka"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
