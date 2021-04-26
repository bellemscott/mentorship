class WelcomeController < ApplicationController
    def show
        @user = current_user
        @mentees = Mentee.all
        @mentors = Mentor.all
        @all_matches = Match.all
        @user_matches = []          #array of all matches for current user
        @all_matches.each do |match|
            if match.user_id == current_user.id && match.accepted == false && match.rejected == false  # && match.rejected == false   #to have the accepted ones not show up again in for u page
                if match.rejected == false
                    @user_matches.push(match)
                end
                # else          #wont show rejected ones?
                #     @user_matches.push(match)
                # end
            end
        end
        @mentor_matches = fill_mentor_matches()     #array of Mentors
        @mentee_matches = fill_mentee_matches()     #array of Mentees
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

    def update
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
