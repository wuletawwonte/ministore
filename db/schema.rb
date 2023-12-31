# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_230_828_052_216) do
  create_table 'inventory_items', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.string 'sku'
    t.integer 'quantity'
    t.string 'brand'
    t.string 'supplier'
    t.string 'serial'
    t.string 'warranty'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'item_category_id', null: false
    t.index ['item_category_id'], name: 'index_inventory_items_on_item_category_id'
    t.index ['name'], name: 'index_inventory_items_on_name', unique: true
    t.index ['user_id'], name: 'index_inventory_items_on_user_id'
  end

  create_table 'item_categories', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.bigint 'users_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_item_categories_on_name', unique: true
    t.index ['users_id'], name: 'index_item_categories_on_users_id'
  end

  create_table 'users', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'provider', limit: 50, default: '', null: false
    t.string 'uid', limit: 50, default: '', null: false
    t.string 'first_name'
    t.string 'last_name'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'inventory_items', 'item_categories'
  add_foreign_key 'inventory_items', 'users'
  add_foreign_key 'item_categories', 'users', column: 'users_id'
end
