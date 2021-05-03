# Models

**Users**

<p> The user model is the first in the logical flow of model creation. When an individual signs up, they are brought to the user form, whose fields are that of the user schema, shown below. </p>
``` xml 
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
```

<p> As far as validation, they must have an email of valid format, a password of a length longer than 6 characters, has a secured password as well, as remember me tokens so a user can save time on sign in. The user also has many has_many assosciations, given that this model is the top of the architecture. Specific requirements are shown below for the user. </p>

``` xml 
attr_accessor :remember_token
    has_one_attached :avatar
    has_many :mentors 
    has_many :mentees
    has_many :channel_users, dependent: :destroy
    has_many :channels, through: :channel_users
    has_many :messages, dependent: :destroy
    has_secure_password
    before_save { self.email = email.downcase }
    validates :firstname, presence: true
    validates :lastname, presence:true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {        case_sensitive: false }, length: { maximum: 50 }
    validates :password, presence: true, length: { minimum: 6 }
    validate :can_only_be_either_mentee_or_mentor
```


**Mentees**

<p> If a user selects the mentee checkbox, they are immediately led to fill out mentee fields such as major, and length of mentorship. The schema is below </p>

``` xml 
    t.string "major"
    t.string "area_of_interest"
    t.string "preferred_method_of_contact"
    t.string "location"
    t.integer "length_of_mentorship"
    t.string "graduation_year"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
```

<p> The associations and validations for being a mentee and filling out the fields are below. Essentially, the fields that are required are those that we eventually match on so they can get matches later on. Also in the model file is a singular method that loads the list of subjects and fills the dropdwon menu for the major field. </p>

``` xml 
    has_many :matches
    has_many :mentors, through: :matches
    has_one_attached :avatar
    validates :major, presence: true
    validates :length_of_mentorship, presence: true
```

**Mentors**

<p>Conversely, if a user selects the mentor checkbox, they are led to fill out the mentor form with fields like current position. For this particular field, we used a gem called Profession which was very helpful as it contained a list of 1000 relavent jobs with methods to assemble them neatly. This list is filled in the mode in a very simple method. </p>

``` xml 
      t.string "area_of_expertise"
      t.string "preferred_method_of_contact"
      t.string "school"
      t.string "current_position"
      t.string "location"
      t.integer "length_of_mentorship"
      t.integer "user_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
```

<p> As far as validations and associations, mentor is exactly the same as mentor except that instead of major being validated to be present, current position must be present. This is also for the purpose of matching later on. </p>


**Matches**

<p> After a user submits the mentor or mentee form, they are taken to the matches index where they can elect to make matches with a button. The reason this was done is because users can make matches multiple times. Say there was a scenario where instead, we didn't have a button, and matches were created as soon as they could be (after the mentor/mentee info is filled out). They go through their matches, hate all of them and reject them all. Now the user cannot have more matches as there is no path to it now. So, instead, we made it easy on the user and had a button. After they click make matches, the matching algorithm is exectured (see Matching), and matches are created as a join between users, mentees, and mentors. The userid in each match corresponds to who's match it is, but during the match creation, the other party's match is also created so they have the match on their page as well. Matches can also be acccepted or rejected, in which case they will move. If accepted, a match will be taken from the explore page and put under the matches tab, and if rejected, the match will never show up in either. </p> 

``` xml 
      t.bigint "mentor_id"
      t.bigint "mentee_id"
      t.integer "user_id"
      t.boolean "accepted", default: false
      t.boolean "rejected", default: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["mentee_id"], name: "index_matches_on_mentee_id"
      t.index ["mentor_id"], name: "index_matches_on_mentor_id"

```
<p> The access/lookup of a match is quite fast, and we are satisfied with the implementation of matches. As far as associations, a match belongs to :mentee and :mentor.</p>

**Channels**
<p> The channels table is quite simple, with just one field for a name of channel. This is used in the implementation of the chat. This name will correspond to the two users involved in a chat. The associations are below.</p>

``` xml 
    has_many :channel_users, dependent: :destroy
    has_many :users, through: :channel_users
    has_many :messages, dependent: :destroy
    validates :name, presence: true
```

**User Channels**
<p> This model is the second piece of the chat implementation. This model instead has two fields, channel id, which corresponds to a Channel, and User id, which corresponds to a user. This model is used in the cable broadcast when users message eachother. The associations are shown below.</p>

``` xml
  belongs_to :channel
  belongs_to :user
```

**Messages**
<p> The final part of the chat implementation is the actual Message. This is the model that corresponds to information that users send eachother. This model has 3 fields, channel_id, user_id, and body, corresponding to a Channel id, a User id (of who sent the message), and body, containing the actual message respectively. The message model also belongs to both channel and user in the associations section. In the body of the class, there are a few 1 line methods that implement the broadcasting. </p> 


**Matching Preferences (not implemented but plan to before final presentation with Pito and Mitchell)
<p> This model, which we have not incorporated into the app yet, contains booleans corresponding to fields to match on. The idea is a user can select what fields to match on if they would/wouldn't like to match on a certain field, ex length of mentorship. </p>
