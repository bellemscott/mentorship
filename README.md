# Brandeis Mentorship - Authors: Belle Scott, Mahima Devanahalli, Alan Huang, Ava Harnick

Heroku link: https://guarded-ridge-55783.herokuapp.com

Github repo: https://github.com/bellemscott/mentorship

Balsamic link: https://balsamiq.cloud/sz8gy6a/px60i7y

Tecnhical Information:

* Ruby 2.7.2

* Postgres 13.2

* Rails 6.1.2

## Summary

Brandeis Mentorship is an app created by a team of Brandeis undergraduate students that creates and fosters mentor/mentee relationships. The purpose of the app is to assist Brandeis undergraduate and graduate students in forming meaningful professional and academic connections. 

## Functionality


### Object Creation
Users can sign up as either a mentor, a mentee, or both. After filling in some basic information, depending on which path these choose, they will be directed to fill in additional information. This additional information is specific to either mentors or mentees, and includes fields such as, but not limited to, desired length of mentorship, location, major, and profession. Users can also elect to click the remember me token so their local system can save their login info for convenience.

### Matching
A primitive, preliminary matching algorithm is also in place that currently matches solely based length of mentorship of the two individuals. Up next in our project is the task of matching based on both location, which will be trivial, and more complex, matching mentee majors with mentor professions. Our strategy to the matching algorithm will be making each Brandeis major, of which there are less than 100, correspond to a list of relavent key words that we will decide based on the professions dataset, which contains 1000 professions. If a profession contains one or many of the keywords, a match can be formed. 

### UI
Users can explore their potential matches, flipping through their list on the explore (home) page. Our next step is letting them have the ability of accepting a match and beginning a conversation. We plan to use Twilio's programmable chat tool to implement mentee/mentor conversations. Users can also view and edit their profile, including uploading and deleting their profile picture.

## Database Schema 

Users
* first name, last name, must be present
* email, must be of valid format and less than 50 characters
* password, must be more than 6 characters
* mentee or/and mentor checkboxes, can check one, both, or none if a user has yet to decide (in this case there will be no matches)
* remember digest, so users' local machines can save their information for convenience 

Mentee
* major, drop down list of all Brandeis subjects, must select one
* area of interest, text, used for adding additional information once matches are created initially to help them decide to accept them or not
* preffered method of contact
* location, drop down menu of state abbreviations
* graduation year
* length of mentorship (in weeks), numeric field 
* user id, used to join mentee record with corresponding user record

Mentor
* area of expertise, text, used for adding additional information once matches are created initially to help them decide to accept them or not
* preffered method of contact
* school/Alma Mater, not necessarily Brandeis
* current Position, drop down menu of 1000 positions, in this format so matching can be done effectively and scalably. If no exact position exists in drop down, they select closest one and elaborate in area of expertise field
* location, drop down menu of state abbreviations
* length of mentorship (in weeks), numeric field
* user id, used to join mentor record with corresponding user record

Matches
* reference mentor id, to join mentee and mentor
* reference mentee id, to join mentor and mentee
* user id, used to join match record with corresponding user record

Active Storage Tables
* adds editing and uploading user profile photos functionality 

## URL Information

We have 5 resources mentioned below: 

  * resources :matches
  * resources :mentees
  * resources :mentors
  * resources :users
  * resources :states, only: :index

Our root page points to the welcome#index page which displays the sign up and log in options: 

  * root 'welcome#index'

The following get url links are used to display our pages:

  * get  '/signup',  to: 'users#new'
  * get    '/login',   to: 'sessions#new'
  * get    '/explore',   to: 'welcome#show'
  * get     '/additional-info', to: 'users#additional_info'

These links are specifically for the profile pages, it is different depending on if the user is a mentee or mentor or neither

  * get '/menteeprofile/:id', to: 'mentees#show', as: 'menteeprofile'
  * get '/mentorprofile/:id', to: 'mentors#show', as: 'mentorprofile'
  * get '/userprofile/:id', to: 'users#show', as: 'userprofile'

The following links are related to the session, it will create a session on login and destroy a session on logout. 

  * post   '/login',   to: 'sessions#create'
  * delete '/logout',  to: 'sessions#destroy'

We will be adding more URL’s once we add our chat functionality and further improve on our matching algorithm so that users will be able to message and view other people’s profiles.

### URL Structure/Pattern
Signup/login option page: /
Users urls: /users, /users/new, /users/create, /users/delete, /users/1, /users/1/change, /users/1/update
Display user login prompt, and check for correct password: /login
Signup: /signup
Logout: /logout
Explore page: /explore
Additional Info: /additional-info

## Dependencies

* gem bootstrap 5.0, bootstrap library -> front end styling
* gem bcrypt -> authentication
* gem profession 0.1.0 -> list of 1000 professions
* gem city-state -> list of state drop downs
* gem rails_admin -> admin portal
* Brandeis University subject data (db/subject.json) -> Brandeis majors data

## Views, Implemented and Planned

Layout: Our layout folder contains a few partials and some universal views
	_footer.html.erb
	_header.html.erb
	application.html.erb
	mailer.html.erb
	mailer.text.erb

Matches: Our Matches views has not been fully implemented yet, as of now we are displaying a table of the mentor and mentee id but we will later be making this page a chat
functionality.
	index.html.erb
	pending: show.html.erb
			chat.html.erb

Mentees: Contains views relating to mentees: editing a profile, viewing a profile as well as creating a profile 
	index.html.erb
	show.html.erb
	new.html.erb
	edit.html.erb
	_form.html.erb

Mentors: Similar to Mentees: Contains views relating to mentees: editing a profile, viewing a profile as well as creating a profile 
	index.html.erb
	show.html.erb
	new.html.erb
	edit.html.erb
	_form.html.erb

Users 
	index.html.erb
	show.html.erb
	new.html.erb
	edit.html.erb
	_form.html.erb
	_mentor_form.html.erb
	_mentee_form.html.erb
	additional_both.html.erb
	additional_mentee.html.erb
	additional_mentor.html.erb
	
Welcome 
	index.html.erb
	show.html.erb

Sessions
	new.html.erb : form to log in 

Shared: Includes shared partials
	_error_messages.html.erb
