require_relative "job_map.rb"
class MatchesController < ApplicationController
  # include CableReady::Broadcaster   #not yet implemented
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

  def home
    @all_matches = Match.all
    @mentors = Mentor.all
    @mentees=Mentee.all
    @users=User.all
    @matches_for_user = @@matches_hash
    @match=Match.first
  end


  # GET /mentors/new
  def new
    @match = Match.new
  end

  # GET /mentors/1/edit
  def edit
  end

  #user is mentor : identifier 0 mentee : identifier 1 both : identifier 2
  def check_duplicate(identifier)
    duplicate = false
    matches = Match.all
    matches.each do |match|
      if match.user_id == @newMatch.user_id && match.mentor_id == @newMatch.mentor_id && match.mentee_id == @newMatch.mentee_id
        duplicate = true
      end
    end
    if duplicate == false
      @newMatch.save
      if identifier == 0    #need a mentee record
        make_mentee_match()
      elsif identifier == 1   #need a mentor record
        make_mentor_match()
      end
    end
    @matches_arr.push(@newMatch)
  end

  def make_mentee_match()
    @users = User.all
    @other_party = @mentees.find_by(id: @newMatch.mentee_id)
    other_party_user_id = @other_party.user_id
    other_user = @users.find_by(id: other_party_user_id)
    @otherMatch= Match.new(:user_id => other_party_user_id, :mentor_id => @newMatch.mentor_id, :mentee_id => @newMatch.mentee_id, :accepted => false, :rejected => false)    #creates the other match
    @otherMatch.save
    @test_party = @mentors.find_by(id: @newMatch.mentor_id)
  end

  def make_mentor_match()
    @users = User.all
    @other_party = @mentors.find_by(id: @newMatch.mentor_id)
    other_party_user_id = @other_party.user_id
    other_user = @users.find_by(id: other_party_user_id)
    @otherMatch= Match.new(:user_id => other_party_user_id, :mentor_id => @newMatch.mentor_id, :mentee_id => @newMatch.mentee_id, :accepted => false, :rejected => false)    #creates the other match
    @otherMatch.save
    @test_party = @mentees.find_by(id: @newMatch.mentee_id)
  end

  def is_mentor()
    @mentor = Mentor.find_by(user_id: current_user.id)
      @mentees.each do |mentee|
        if mentee.user_id != @mentor.user_id
          if (@common_subjects_map[mentee.major]) != nil    #if theres a record in map for particular job/major
            if @mentor.length_of_mentorship==mentee.length_of_mentorship or (@common_subjects_map[mentee.major].include? @mentor.current_position)
              @newMatch= Match.new(:user_id => current_user.id, :mentor_id => @mentor.id, :mentee_id => mentee.id, :accepted => false, :rejected => false)
              check_duplicate(0)
            end
          else
            if @mentor.length_of_mentorship==mentee.length_of_mentorship 
              @newMatch= Match.new(:user_id => current_user.id, :mentor_id => @mentor.id, :mentee_id => mentee.id, :accepted => false, :rejected => false)
              check_duplicate(0)
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
        if (@common_subjects_map[@mentee.major]) != nil
          if (mentor.length_of_mentorship==@mentee.length_of_mentorship) or (@common_subjects_map[@mentee.major].include? mentor.current_position)
            @newMatch= Match.new(:user_id => current_user.id, :mentor_id => mentor.id, :mentee_id => @mentee.id, :accepted => false, :rejected => false)
            check_duplicate(1)
          end
        else
          if (mentor.length_of_mentorship==@mentee.length_of_mentorship)
            @newMatch= Match.new(:user_id => current_user.id, :mentor_id => mentor.id, :mentee_id => @mentee.id, :accepted => false, :rejected => false)
            check_duplicate(1)
          end
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
    @first_match = Match.new()
    @common_subjects_map=JobMap.new.map_method
    @matches_arr=[]
    if current_user.mentor 
      is_mentor()
    else
      is_mentee()
    end
    @created = true
    @user = current_user
    @user_matches = Match.where(user_id: current_user.id, accepted: false, rejected:false)
    @user_match = nil

    redirect_to '/matches'    #redirect to index
  end
  
  def set_match
  end

  # Only allow a list of trusted parameters through.
  def mentor_params

  end

  def show
  end

end