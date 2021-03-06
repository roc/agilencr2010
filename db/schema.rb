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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101206073204) do

  create_table "submissions", :force => true do |t|
    t.string   "title"
    t.string   "submission_type"
    t.text     "abstract"
    t.text     "comments"
    t.string   "duration"
    t.integer  "user_id"
    t.string   "submission_status", :default => "SUBMITTED"
    t.string   "audience_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "speaker_bio"
    t.text     "take_away"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "encrypted_password"
    t.boolean  "admin"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_organization"
    t.string   "user_phone"
  end

end
