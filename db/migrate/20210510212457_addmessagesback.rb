class Addmessagesback < ActiveRecord::Migration[6.1]
  def change
    create_table "messages", force: :cascade do |t|
      t.text "content"
      t.integer "user_id", null: false
      t.integer "room_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["room_id"], name: "index_messages_on_room_id"
      t.index ["user_id"], name: "index_messages_on_user_id"
    end
    create_table "rooms", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
