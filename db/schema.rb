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

ActiveRecord::Schema[7.2].define(version: 2024_09_19_122830) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "ar_name"
    t.string "image_path"
    t.integer "sold_count"
    t.integer "in_stock_count"
    t.datetime "added_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "engines", force: :cascade do |t|
    t.string "engine_power"
    t.integer "vehicle_model_id"
    t.integer "vehicle_year_id"
    t.integer "power_kw"
    t.integer "power_ps"
    t.string "fuel_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_model_id"], name: "index_engines_on_vehicle_model_id"
    t.index ["vehicle_year_id"], name: "index_engines_on_vehicle_year_id"
  end

  create_table "fitments", force: :cascade do |t|
    t.integer "product_id"
    t.integer "vehicle_year_id"
    t.integer "vehicle_model_id"
    t.integer "engine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["engine_id"], name: "index_fitments_on_engine_id"
    t.index ["product_id"], name: "index_fitments_on_product_id"
    t.index ["vehicle_model_id"], name: "index_fitments_on_vehicle_model_id"
    t.index ["vehicle_year_id"], name: "index_fitments_on_vehicle_year_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.string "ar_name"
    t.string "image_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "origins", force: :cascade do |t|
    t.string "origin_name"
    t.string "origin_name_ar"
    t.integer "vehicle_model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_model_id"], name: "index_origins_on_vehicle_model_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string "name"
    t.string "ar_name"
    t.string "image_path"
    t.datetime "added_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.index ["category_id"], name: "index_parts_on_category_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "part_number"
    t.string "oem_number"
    t.integer "part_id"
    t.integer "manufacturer_id"
    t.float "retail_price_lyd"
    t.float "base_price_lyd"
    t.float "base_price_usd"
    t.float "retail_price_usd"
    t.integer "stock_quantity"
    t.integer "sold_quantity"
    t.datetime "start_date_availability"
    t.datetime "end_date_availability"
    t.boolean "is_external"
    t.integer "shipping_days_from"
    t.integer "shipping_days_to"
    t.string "status"
    t.string "warranty"
    t.boolean "universal_fit"
    t.string "image_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manufacturer_id"], name: "index_products_on_manufacturer_id"
    t.index ["part_id"], name: "index_products_on_part_id"
  end

  create_table "variations", force: :cascade do |t|
    t.integer "product_id"
    t.string "variation_name"
    t.string "variation_value"
    t.string "variation_name_ar"
    t.string "variation_value_ar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_variations_on_product_id"
  end

  create_table "vehicle_makes", force: :cascade do |t|
    t.string "make_name"
    t.string "make_name_ar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_models", force: :cascade do |t|
    t.string "name_model"
    t.string "model_name_ar"
    t.integer "vehicle_make_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_make_id"], name: "index_vehicle_models_on_vehicle_make_id"
  end

  create_table "vehicle_years", force: :cascade do |t|
    t.string "year"
    t.integer "vehicle_model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_model_id"], name: "index_vehicle_years_on_vehicle_model_id"
  end

  add_foreign_key "engines", "vehicle_models"
  add_foreign_key "engines", "vehicle_years"
  add_foreign_key "fitments", "engines"
  add_foreign_key "fitments", "products"
  add_foreign_key "fitments", "vehicle_models"
  add_foreign_key "fitments", "vehicle_years"
  add_foreign_key "origins", "vehicle_models"
  add_foreign_key "parts", "categories"
  add_foreign_key "products", "manufacturers"
  add_foreign_key "products", "parts"
  add_foreign_key "variations", "products"
  add_foreign_key "vehicle_models", "vehicle_makes"
  add_foreign_key "vehicle_years", "vehicle_models"
end
