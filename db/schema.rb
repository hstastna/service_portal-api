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

ActiveRecord::Schema.define(version: 20190116194409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_items", force: :cascade do |t|
    t.integer "count"
    t.bigint "order_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "ordered_at"
    t.datetime "completed_at"
    t.datetime "updated_at", null: false
    t.string "topology_task_ref"
    t.bigint "tenant_id"
    t.string "service_plan_ref"
    t.bigint "portfolio_item_id"
    t.jsonb "service_parameters"
    t.jsonb "provider_control_parameters"
    t.index ["tenant_id"], name: "index_order_items_on_tenant_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "user_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "ordered_at"
    t.datetime "completed_at"
    t.datetime "updated_at", null: false
    t.bigint "tenant_id"
    t.index ["tenant_id"], name: "index_orders_on_tenant_id"
  end

  create_table "portfolio_items", force: :cascade do |t|
    t.boolean "favorite"
    t.string "name"
    t.string "description"
    t.boolean "orphan"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tenant_id"
    t.string "service_offering_ref"
    t.bigint "portfolio_id"
    t.string "service_offering_source_ref"
    t.index ["tenant_id"], name: "index_portfolio_items_on_tenant_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "enabled"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tenant_id"
    t.index ["tenant_id"], name: "index_portfolios_on_tenant_id"
  end

  create_table "progress_messages", force: :cascade do |t|
    t.datetime "received_at"
    t.string "level"
    t.string "message"
    t.string "order_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tenant_id"
    t.index ["tenant_id"], name: "index_progress_messages_on_tenant_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ref_id"
    t.index ["ref_id"], name: "index_tenants_on_ref_id"
  end

end
