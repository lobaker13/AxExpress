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

ActiveRecord::Schema.define(version: 20170810183050) do

  create_table "breeds", force: :cascade do |t|
    t.string "name"
    t.integer "species"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "core"
    t.string "procedure_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clinical_doses", force: :cascade do |t|
    t.decimal "min"
    t.decimal "max"
    t.integer "drug_id"
    t.integer "species_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drug_id"], name: "index_clinical_doses_on_drug_id"
  end

  create_table "drugs", force: :cascade do |t|
    t.string "name"
    t.string "commercial_name"
    t.string "klass"
    t.string "category"
    t.decimal "concentration"
    t.text "adverse"
    t.integer "route_of_admin_value"
    t.string "pronunciation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_procedures", force: :cascade do |t|
    t.integer "procedure_id"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_patient_procedures_on_patient_id"
    t.index ["procedure_id"], name: "index_patient_procedures_on_procedure_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.date "dob"
    t.integer "sex"
    t.decimal "weight"
    t.integer "breed_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["breed_id"], name: "index_patients_on_breed_id"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "procedures", force: :cascade do |t|
    t.string "name"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_procedures_on_category_id"
  end

  create_table "protocol_drugs", force: :cascade do |t|
    t.decimal "dose"
    t.integer "additional_analgesic"
    t.integer "drug_id"
    t.integer "protocol_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drug_id"], name: "index_protocol_drugs_on_drug_id"
    t.index ["protocol_id"], name: "index_protocol_drugs_on_protocol_id"
  end

  create_table "protocols", force: :cascade do |t|
    t.decimal "weight"
    t.integer "age"
    t.integer "asa"
    t.integer "bcs"
    t.text "alert"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_protocols_on_patient_id"
  end

  create_table "risks", force: :cascade do |t|
    t.integer "asa"
    t.string "temperament"
    t.integer "bcs"
    t.string "breed"
    t.string "comorbidities"
    t.integer "age"
    t.integer "heart_murmur", null: false
    t.string "procedure"
    t.boolean "history"
    t.integer "patient_procedure_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_procedure_id"], name: "index_risks_on_patient_procedure_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "fname"
    t.string "lname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
