class MatchesController < ApplicationController
    before_action :set_match, only: %i[ show edit update destroy ]

  @@matches_hash = {}
  # GET /mentors or /mentors.json
  def index
    @all_matches = Match.all
    @mentors = Mentor.all
    @mentees=Mentee.all
    @users=User.all
    @matches_for_user = @@matches_hash
    @match=Match.first
  end


  # GET /mentors/1 or /mentors/1.json
  def show
  end


  # GET /mentors/new
  def new
    @match = Match.new
  end

  # GET /mentors/1/edit
  def edit
  end

  def check_duplicate(newMatch)
    @all_matches.each do |match|
      if match.user_id == newMatch.user_id && match.mentor_id == newMatch.mentor_id && match.mentee_id == newMatch.mentee_id
        puts "duplicate record"
      else
        newMatch.save
        @matches_arr.push(newMatch)
      end
    end
  end

  def is_mentor()
    @mentor = Mentor.find_by(user_id: current_user.id)
      @mentees.each do |mentee|
        if mentee.user_id != @mentor.user_id
          if @mentor.length_of_mentorship==mentee.length_of_mentorship
            newMatch = Match.new(:user_id => current_user.id, :mentor_id => @mentor.id, :mentee_id => mentee.id, :accepted => false)
            check_duplicate(newMatch)
          end
        end
      end
      @@matches_hash[current_user.id] = @matches_arr
  end

  def is_both()   #NOT fully implemented yet!!!
    @mentors.each do |mentor|
      @mentess.each do |mentee|
          if mentee.user_id != mentor.user_id 
              if mentor.length_of_mentorship==mentee.length_of_mentorship
                @newMatch= Match.new(:user_id => current_user.id, :mentor_id => mentor.id, :mentee_id => @mentee.id, :accepted => false)
                @all_matches.each do |match|
                  if match.user_id == current_user.id && match.mentor_id == mentor.id && match.mentee_id == @mentee.id
                    puts "duplicate record"
                  else
                    @newMatch.save
                    @matches_arr.push(@newMatch)
                  end
                end
              end
          end
      end
    end
    @@matches_hash[current_user.id] = @matches_arr
  end

  def is_mentee()
    @mentee = Mentee.find_by(user_id: current_user.id)
    @mentors.each do |mentor|
      if current_user.id != mentor.user_id
        if mentor.length_of_mentorship==@mentee.length_of_mentorship
          newMatch= Match.new(:user_id => current_user.id, :mentor_id => mentor.id, :mentee_id => @mentee.id, :accepted => false)
          check_duplicate(newMatch)
        end
      end
    end
    @@matches_hash[current_user.id] = @matches_arr
  end
  # POST /matches or /mentors.json
  def create
    @mentors = Mentor.all
    @mentees= Mentee.all 
    @all_matches = Match.all
    puts @mentees.length()
    @matches_arr=[]
    if current_user.mentor 
      is_mentor()
    elsif current_user.mentor && current_user.mentee
      is_both()
    else
      is_mentee()
    end
    @created = true
    redirect_to '/matches'    #redirect to index
end
    
#PATCH /matches
def update
  @mentors = Mentor.all
  @mentees= Mentee.all 
  @all_matches = Match.all
  @matches_arr=[]
  if current_user.mentor == true && current_user.mentee == false
    is_mentor()
  elsif current_user.mentee  && current_user.mentor == false
    is_mentee()
  else
    is_both()
  end
  redirect_to '/matches'    #redirect to index
end


  def set_match
    
  end

  # Only allow a list of trusted parameters through.
  def mentor_params

  end

end