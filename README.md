# Brandeis Mentorship - Authors: Belle Scott, Mahima Devanahalli, Alan Huang, Ava Harnick

[![Rails Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop-rails)

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
An matching algorithm is also in place that currently matches based length of mentorship (in weeks) desired, as well as matches mentee's majors to mentor's professions/areas of expertise. When a user clicks 'Make Matches', their matches are created upon which point they can explore them, as well as accept/reject those matches. When they accept a match, the match moves to their Matches page, and the status (accepted by other user, pending, rejected) is shown. If the status is rejected, a reject option comes up for the user in which case the match is removed from their list. Also, we have implemented that users will continue to get new matches as long as there are more users they haven't yet seen that match their criteria. Upon a new user's creation, the matches made for that user will also be added to existing users that form the other party. If a match is accepted by both users, a chat option will pop up, allowing the two to connect and message in the site.

### UI
Users can explore their potential matches, flipping through their list on the explore (home) page. The cards on the explore page contain the profile picture as well as their general information Users can also view and edit their profile, including uploading and deleting their profile picture.

## Database Schema 

Users
* first name, last name, must be present
* email, must be of valid format and less than 50 characters
* password, must be more than 6 characters
* mentee or/and mentor checkboxes, can check one or the other 
* remember digest, so users' local machines can save their information for convenience 
* accepted, true or false
* rejected, true or false

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

Matching preferences - created but not integrated with functionality yet
user can select preferences on which to match to other users on, ex: user A wanted to match based on being located in the state of california, but did not care whether they were a brandeis_alumni, A would uncheck brandeis_alumni checkbox, which are default true
* boolean brandeis_alumni
* boolean location
* boolean length of mentorship
* boolean common_subjects
* integer user_id

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
