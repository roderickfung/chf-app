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

ActiveRecord::Schema.define(version: 20160818014816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "password_confirmation"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "clinicians", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "password"
    t.string   "password_confirmation"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "data_apis", force: :cascade do |t|
    t.text     "fb_data_full"
    t.integer  "patient_log_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["patient_log_id"], name: "index_data_apis_on_patient_log_id", using: :btree
  end

  create_table "fam_docs", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "address"
    t.string   "phone",      limit: 20
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "patient_logs", force: :cascade do |t|
    t.date     "date"
    t.integer  "heartrate"
    t.integer  "bp_hi"
    t.integer  "bp_low"
    t.integer  "weight"
    t.string   "exerting_breath"
    t.string   "night_breath"
    t.string   "leg_swollen"
    t.string   "lightheadedness"
    t.integer  "patient_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["patient_id"], name: "index_patient_logs_on_patient_id", using: :btree
  end

  create_table "patient_recs", force: :cascade do |t|
    t.date     "visit_date"
    t.text     "diagnoses"
    t.date     "diag_date"
    t.text     "diag_description"
    t.text     "current_prescription"
    t.text     "new_prescription"
    t.date     "prescribed_date"
    t.date     "new_prescription_end"
    t.integer  "clinician_id"
    t.integer  "patient_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["clinician_id"], name: "index_patient_recs_on_clinician_id", using: :btree
    t.index ["patient_id"], name: "index_patient_recs_on_patient_id", using: :btree
  end

  create_table "patients", force: :cascade do |t|
    t.bigint   "care_id"
    t.string   "care_handler"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "sex"
    t.integer  "age"
    t.string   "email"
    t.string   "phone",                 limit: 20
    t.string   "address"
    t.string   "password"
    t.string   "password_confirmation"
    t.integer  "clinician_id"
    t.integer  "fam_doc_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["clinician_id"], name: "index_patients_on_clinician_id", using: :btree
    t.index ["fam_doc_id"], name: "index_patients_on_fam_doc_id", using: :btree
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.string   "searchable_type"
    t.integer  "searchable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree
  end

  add_foreign_key "data_apis", "patient_logs"
  add_foreign_key "patient_logs", "patients"
  add_foreign_key "patient_recs", "clinicians"
  add_foreign_key "patient_recs", "patients"
  add_foreign_key "patients", "clinicians"
  add_foreign_key "patients", "fam_docs"
end
