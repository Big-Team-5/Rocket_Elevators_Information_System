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

ActiveRecord::Schema.define(version: 2021_02_24_105134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "type_of_address"
    t.string "status"
    t.string "entity"
    t.string "number_and_street"
    t.string "suite_or_apartment"
    t.string "city"
    t.string "postal_code"
    t.string "country"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batteries", force: :cascade do |t|
    t.string "buildingId"
    t.string "Type"
    t.string "Status"
    t.string "EmployeeId"
    t.string "date_of_commissioning"
    t.string "date_of_last_inspection"
    t.string "certificate_of_operations"
    t.string "information"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "building_details", force: :cascade do |t|
    t.string "buildingId"
    t.string "information_key"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.string "CustomerId"
    t.string "address_of_the_building"
    t.string "Full_name_of_the_building_administrator"
    t.string "phone_number_of_the_building_administrator"
    t.string "Full_name_of_the_technical_contact_for_the_building"
    t.string "technical_contact_email_for_the_building"
    t.string "technical_contact_phone_for_the_building"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "columns", force: :cascade do |t|
    t.string "batteryId"
    t.string "Type"
    t.string "number_of_floors_served"
    t.string "status"
    t.string "information"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "UserId"
    t.string "compagny_Name"
    t.string "compagny_headquarter_address"
    t.string "Full_Name_of_the_compagny_contact"
    t.string "compagny_contact_number"
    t.string "email_of_the_compagny_contact"
    t.string "compagny_description"
    t.string "Full_name_of_the_technical_authority"
    t.string "technical_authority_phone_for_service"
    t.string "technical_manager_email_for_service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elevators", force: :cascade do |t|
    t.string "columnId"
    t.string "serial_number"
    t.string "model"
    t.string "type"
    t.string "status"
    t.string "date_of_commissioning"
    t.string "date_of_last_inspection"
    t.string "certificate_of_inspection"
    t.string "information"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.boolean "active"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "fact_quotes", force: :cascade do |t|
    t.bigint "QuoteId"
    t.datetime "Creation"
    t.text "Company_Name"
    t.text "Email"
    t.integer "NbElevator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leads", force: :cascade do |t|
    t.string "Full_Name"
    t.string "Company_Name"
    t.string "Email"
    t.string "Phone"
    t.string "Project_Name"
    t.string "Project_Description"
    t.string "Department_In_Charge"
    t.string "Message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quote_forms", force: :cascade do |t|
    t.string "FirstName"
    t.string "LastName"
    t.string "PhoneNumber"
    t.string "Email"
    t.string "Elevators"
    t.string "Price_Per_Unit"
    t.string "Sum_For_All_Units"
    t.string "Installation_Fees"
    t.string "Total_Price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "superadmin_role", default: false
    t.boolean "emploiye_role", default: false
    t.boolean "user_role", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "employees", "users"
end
