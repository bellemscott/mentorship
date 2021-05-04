class WelcomeController < ApplicationController
    def show
        @user = current_user
        @mentees = Mentee.all
        @mentors = Mentor.all
        @all_matches = Match.all
        @user_matches = Match.where(user_id: current_user.id, accepted: false, rejected:false)
        @mentor_matches = fill_mentor_matches()     # array of Mentors
        @mentee_matches = fill_mentee_matches()     # array of Mentees
        @user_match = nil
        if @user.mentee?
            @mentee_id = Mentee.find_by(user_id: @user.id).id
            @users = @mentor_matches
            @role = "mentor"
        end
        if @user.mentor?
            @mentor_id = Mentor.find_by(user_id: @user.id).id
            @users = @mentee_matches
            @role = "mentee"
        end
    end

def fill_mentor_matches
    temp_mentor_matches = []
    @user_matches.each do |match|
        mentor_record = Mentor.find_by(id: match.mentor_id)
        temp_mentor_matches.push(mentor_record)
    end
    return temp_mentor_matches
end

def fill_mentee_matches
    temp_mentee_matches = []
    @user_matches.each do |match|
        mentee_record = Mentee.find_by(id: match.mentee_id)
        temp_mentee_matches.push(mentee_record)
    end
    return temp_mentee_matches
end

def accept
    @match = Match.find_by(id: params[:match_id].to_i)
    accepted = true
    @match.accept(accepted)
    redirect_to matches_path
end

def reject
    @match = Match.find_by(id: params[:match_id].to_i)
    rejected = true
    @match.reject(rejected)
    redirect_to explore_path
end
end
