class Addmessages < ActiveRecord::Migration[6.1]
  def change
    create_table "messages", force: :cascade do |t|
      t.integer  "chatroom_id"
      t.integer  "user_id"
      t.text     "body"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
      t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
      t.index ["user_id"], name: "index_messages_on_user_id"
    end
  end
end
