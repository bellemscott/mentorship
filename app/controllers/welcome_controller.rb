class WelcomeController < ApplicationController
    def show
        @user = current_user
        @mentees = Mentee.all
        @mentors = Mentor.all
    end
end
