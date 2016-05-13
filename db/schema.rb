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

ActiveRecord::Schema.define(version: 20160512225143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessments", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.float    "answer"
    t.boolean  "completion"
    t.integer  "participation_id"
    t.integer  "question_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "evaluations", ["participation_id"], name: "index_evaluations_on_participation_id", using: :btree
  add_index "evaluations", ["question_id"], name: "index_evaluations_on_question_id", using: :btree

  create_table "participations", force: :cascade do |t|
    t.string   "relation"
    t.boolean  "completion"
    t.integer  "user_id"
    t.integer  "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "participations", ["survey_id"], name: "index_participations_on_survey_id", using: :btree
  add_index "participations", ["user_id"], name: "index_participations_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "body"
    t.string   "context"
    t.integer  "assessment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "questions", ["assessment_id"], name: "index_questions_on_assessment_id", using: :btree

  create_table "selfevaluations", force: :cascade do |t|
    t.float    "answer"
    t.boolean  "completion"
    t.integer  "survey_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "selfevaluations", ["question_id"], name: "index_selfevaluations_on_question_id", using: :btree
  add_index "selfevaluations", ["survey_id"], name: "index_selfevaluations_on_survey_id", using: :btree

  create_table "surveys", force: :cascade do |t|
    t.string   "heading"
    t.string   "intro"
    t.integer  "user_id"
    t.integer  "assessment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "surveys", ["assessment_id"], name: "index_surveys_on_assessment_id", using: :btree
  add_index "surveys", ["user_id"], name: "index_surveys_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "email"
    t.string   "password_digest"
    t.string   "user_photo"
    t.boolean  "registration"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "evaluations", "participations"
  add_foreign_key "evaluations", "questions"
  add_foreign_key "participations", "surveys"
  add_foreign_key "participations", "users"
  add_foreign_key "questions", "assessments"
  add_foreign_key "selfevaluations", "questions"
  add_foreign_key "selfevaluations", "surveys"
  add_foreign_key "surveys", "assessments"
  add_foreign_key "surveys", "users"
end
