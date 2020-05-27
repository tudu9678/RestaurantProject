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

ActiveRecord::Schema.define(version: 2020_05_25_081317) do

  create_table "bills", primary_key: "bill_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "order_id"
    t.datetime "bill_date"
    t.float "amount"
    t.float "discount"
    t.index ["order_id"], name: "fk_order_bill"
  end

  create_table "diningtables", primary_key: "table_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "chairs_cnt"
    t.integer "status_id"
    t.index ["status_id"], name: "fk_status"
  end

  create_table "diningtablestatus", primary_key: "status_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "status_info"
  end

  create_table "diningtabletrack", primary_key: "serial", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "table_id"
    t.integer "order_id"
    t.index ["order_id"], name: "fk_order_table"
    t.index ["table_id"], name: "fk_table"
  end

  create_table "menu_classes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menu_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menuclass", primary_key: "class_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "class_name", limit: 100, collation: "utf8_general_ci"
    t.integer "menu_id"
    t.index ["menu_id"], name: "fk_menu"
  end

  create_table "menuitems", primary_key: "item_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "item_name", limit: 100, collation: "utf8_general_ci"
    t.text "description"
    t.float "price"
    t.integer "class_id"
    t.index ["class_id"], name: "fk_menuclass"
  end

  create_table "orderdetails", primary_key: "serial", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "item_id"
    t.integer "order_id"
    t.integer "qty"
    t.float "amount"
    t.index ["item_id"], name: "fk_items"
    t.index ["order_id"], name: "fk_orders"
  end

  create_table "orders", primary_key: "order_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "order_date"
    t.integer "ordertype_id"
    t.index ["ordertype_id"], name: "fk_ordertype"
  end

  create_table "ordertype", primary_key: "ordertype_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "ordertype_name", limit: 100, collation: "utf8_general_ci"
  end

  create_table "restaurant", primary_key: "restaurant_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "restaurant_name", limit: 100, collation: "utf8_general_ci"
    t.text "address"
    t.string "phone", limit: 20
  end

  create_table "restaurant_menus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "restaurantmenu", primary_key: "menu_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "menu_ver"
  end

  add_foreign_key "bills", "orders", primary_key: "order_id", name: "fk_order_bill"
  add_foreign_key "diningtables", "diningtablestatus", column: "status_id", primary_key: "status_id", name: "fk_status"
  add_foreign_key "diningtabletrack", "diningtables", column: "table_id", primary_key: "table_id", name: "fk_table"
  add_foreign_key "diningtabletrack", "orders", primary_key: "order_id", name: "fk_order_table"
  add_foreign_key "menuclass", "restaurantmenu", column: "menu_id", primary_key: "menu_id", name: "fk_menu"
  add_foreign_key "menuitems", "menuclass", column: "class_id", primary_key: "class_id", name: "fk_menuclass"
  add_foreign_key "orderdetails", "menuitems", column: "item_id", primary_key: "item_id", name: "fk_items"
  add_foreign_key "orderdetails", "orders", primary_key: "order_id", name: "fk_orders"
  add_foreign_key "orders", "ordertype", primary_key: "ordertype_id", name: "fk_ordertype"
end
