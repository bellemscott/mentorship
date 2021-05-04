# Table of contents

* [General Overview](overview.md)
  * [Schema](schema.md)
  * [Models](models.md)
  * [Matches](matches.md)
  * [User Interface](ui.md)
  * [Chat](chat.md)
  * [Technologies](technologies.md)

  * [Bugs](bugs.md)
  * [Reflection](reflection.md)


# Schema

``` xml 
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
```

 Each match contains the ids of the mentor and the mentee that are matched. Mentors and mentees are matched based on the length of the mentorship they both desire, the major of the mentee and the occupation of the mentor. Once the match is created the user can view their matches profile. Information such as area of interest, perferred method of contact, and current location can be viewed. From there, the user can choose to accept or reject the match. Once a match is accepted the mentee and the mentor can chat. 
 
``` xml 
 create_table "mentees", force: :cascade do |t|
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
 ```
 
  Mentees must enter their major and their desired length of mentorship. This information is used to create a match with a mentor. Mentees can also enter their area of interest, preferred method of contact, location, and graduation year. This information will be displayed on their profiled to give potential mentors some more information about them. 
  
``` xml 
    create_table "mentors", force: :cascade do |t|
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
  
 ```
   Mentors must enter their current position and their desired length of mentorship. This information is used to create a match with a mentee. Mentors can also enter their area of expertise, preferred method of contact, location, and the school they graduated from. This information will be displayed on their profiled to give potential mentees some more information about them. 
   
``` xml 
   create_table "messages", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.bigint "user_id", null: false
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["channel_id"], name: "index_messages_on_channel_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end
  
 ```
  The messages table allows mentors and mentees who have matached with each other to send messages to each other. Through the chat, mentees and mentors that have matched can exchange contact information and set up a meeting. This was one of our most difficult features to implement. 
  
``` xml
  create_table "users", force: :cascade do |t|
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
    t.string "username"
  end
 ```
  When a user creates an account they are prompted to enter their first name, last name, email, and a password that they have created. Users can sign up as either a mentee or a mentor.  
