# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_16_093508) do

  create_table "cocktails", force: :cascade do |t|
    t.string "name"
    t.string "img_url"
    t.text "method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "drinkId"
  end

  create_table "combinations", force: :cascade do |t|
    t.integer "measure_id", null: false
    t.integer "ingredient_id", null: false
    t.integer "cocktail_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cocktail_id"], name: "index_combinations_on_cocktail_id"
    t.index ["ingredient_id"], name: "index_combinations_on_ingredient_id"
    t.index ["measure_id"], name: "index_combinations_on_measure_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "measures", force: :cascade do |t|
    t.string "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_cocktails", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "cocktail_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "notes"
    t.index ["cocktail_id"], name: "index_user_cocktails_on_cocktail_id"
    t.index ["user_id"], name: "index_user_cocktails_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "combinations", "cocktails"
  add_foreign_key "combinations", "ingredients"
  add_foreign_key "combinations", "measures"
  add_foreign_key "user_cocktails", "cocktails"
  add_foreign_key "user_cocktails", "users"
end
