Schema
'''
  create_table "matches", force: :cascade do |t|
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
  '''
 Each match object contains the id of the mentor and the mentee that are matched. Mentors are matches to mentees based on the lenght of the mentorship they both desire, the major of the mentee and the occupation of the mentor. Once the match is created User can view their matches profile. Information such as acedmitic interests, perferred method of contact, and current location can be viewed. From there, the user can choose to accept or reject the match. 
 
 
