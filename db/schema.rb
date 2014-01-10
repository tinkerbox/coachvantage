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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140110093652) do

  create_table "contacts", :force => true do |t|
    t.integer  "user_id"
    t.string   "salutation"
    t.string   "first_name",   :default => "", :null => false
    t.string   "last_name",    :default => "", :null => false
    t.string   "gender",       :default => "", :null => false
    t.date     "birthday"
    t.string   "home_addr"
    t.string   "mobile"
    t.string   "tel_home"
    t.string   "tel_office"
    t.string   "email",        :default => "", :null => false
    t.string   "skype_id",     :default => "", :null => false
    t.string   "biz_title"
    t.string   "company_name"
    t.string   "company_addr"
    t.string   "interests"
    t.string   "life_obj"
    t.string   "biz_obj"
    t.string   "profile"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "contacts", ["email"], :name => "index_contacts_on_email", :unique => true

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "settings", :force => true do |t|
    t.integer  "user_id"
    t.string   "color_scheme"
    t.string   "motivational_quotes_feed"
    t.string   "custom_logo"
    t.string   "customized_message"
    t.string   "payment_service"
    t.string   "paypal_email_address"
    t.string   "sync_calendars"
    t.string   "buffer_time"
    t.string   "freshbook_id"
    t.string   "intuit_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",                   :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "customer_id"
    t.string   "last_4_digits"
    t.string   "token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
