class InitSchema < ActiveRecord::Migration[6.1]
  def up
    # These are extensions that must be enabled in order to support this database
    enable_extension "plpgsql"
    create_table "active_storage_attachments", id: :serial do |t|
      t.string "name", null: false
      t.string "record_type", null: false
      t.bigint "record_id", null: false
      t.bigint "blob_id", null: false
      t.datetime "created_at", null: false
      t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
      t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
    end
    create_table "active_storage_blobs", id: :serial do |t|
      t.string "key", null: false
      t.string "filename", null: false
      t.string "content_type"
      t.text "metadata"
      t.string "service_name", null: false
      t.bigint "byte_size", null: false
      t.string "checksum", null: false
      t.datetime "created_at", null: false
      t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
    end
    create_table "active_storage_variant_records", id: :serial do |t|
      t.bigint "blob_id", null: false
      t.string "variation_digest", null: false
      t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
    end
    create_table "matches", id: :serial do |t|
      t.bigint "mentor_id"
      t.bigint "mentee_id"
      t.integer "user_id"
      t.boolean "accepted", default: false
      t.boolean "rejected", default: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["mentee_id"], name: "index_matches_on_mentee_id"
      t.index ["mentor_id"], name: "index_matches_on_mentor_id"
    end
    create_table "matching_preferences", id: :serial do |t|
      t.boolean "location", default: true
      t.boolean "length_of_mentorship", default: true
      t.boolean "common_subjects", default: true
      t.boolean "brandeis_alumni", default: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.integer "user_id"
    end
    create_table "mentees", id: :serial do |t|
      t.string "major"
      t.string "area_of_interest"
      t.string "preferred_method_of_contact"
      t.string "location"
      t.integer "length_of_mentorship"
      t.string "graduation_year"
      t.integer "user_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
    create_table "mentors", id: :serial do |t|
      t.string "area_of_expertise"
      t.string "preferred_method_of_contact"
      t.string "school"
      t.string "current_position"
      t.string "location"
      t.integer "length_of_mentorship"
      t.integer "user_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
    create_table "messages" do |t|
      t.text "content"
      t.integer "user_id", null: false
      t.integer "room_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["room_id"], name: "index_messages_on_room_id"
      t.index ["user_id"], name: "index_messages_on_user_id"
    end
    create_table "rooms" do |t|
      t.string "name"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
    create_table "users", id: :serial do |t|
      t.string "firstname"
      t.string "lastname"
      t.string "email"
      t.string "password"
      t.string "password_digest"
      t.boolean "mentor"
      t.boolean "mentee"
      t.string "remember_digest"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
    add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
    add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
