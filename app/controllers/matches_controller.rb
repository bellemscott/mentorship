class MatchesController < ApplicationController
  include CableReady::Broadcaster
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
    puts "here belle!!! making other mentee match"
    puts @otherMatch.id
  end

  def make_mentor_match()
    @users = User.all
    @other_party = @mentors.find_by(id: @newMatch.mentor_id)
    other_party_user_id = @other_party.user_id
    other_user = @users.find_by(id: other_party_user_id)
    @otherMatch= Match.new(:user_id => other_party_user_id, :mentor_id => @newMatch.mentor_id, :mentee_id => @newMatch.mentee_id, :accepted => false, :rejected => false)    #creates the other match
    @otherMatch.save
    @test_party = @mentees.find_by(id: @newMatch.mentee_id)
    puts "here belle!!! making other mentor match"
    puts @otherMatch.id
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

  # def is_both()   #NOT fully implemented yet!!!
  #   @mentors.each do |mentor|
  #     @mentess.each do |mentee|
  #         if mentee.user_id != mentor.user_id 
  #             if mentor.length_of_mentorship==mentee.length_of_mentorship
  #               newMatch= Match.new(:user_id => current_user.id, :mentor_id => mentor.id, :mentee_id => @mentee.id, :accepted => false)
  #               #check_duplicate(newMatch, 2)
  #               newMatch.save
  #             end
  #         end
  #     end
  #   end
  #   @@matches_hash[current_user.id] = @matches_arr
  # end

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
    @first_match.make_map()
    @common_subjects_map = @first_match.get_hash()
    puts @common_subjects_map.length()
    puts "HIIIIIIIIIIII"
    puts @mentees.length()
    @matches_arr=[]
    if current_user.mentor 
      is_mentor()
    # elsif current_user.mentor && current_user.mentee
    #   is_both()
    else
      is_mentee()
    end
    @created = true

    @user = current_user
    @mentees = Mentee.all
    @mentors = Mentor.all
    @all_matches = Match.all
    @user_matches = Match.where(user_id: current_user.id, accepted: false, rejected:false)
    puts "Hi belle its okay"
    @mentor_matches = fill_mentor_matches()     #array of Mentors
    @mentee_matches = fill_mentee_matches()     #array of Mentees
    @user_match = nil
    if @otherMatch != nil
      cable_ready["matching"].insert_adjacent_html(
        selector: "#matching",
        position: "afterbegin",
        html: render_to_string("matches/show.html.erb", locals: {user_match:@test_party})
      )
    end
    cable_ready.broadcast

    redirect_to '/matches'    #redirect to index
end
  

  def set_match
    
  end

  # Only allow a list of trusted parameters through.
  def mentor_params

  end


  def show
    @user = current_user
    @mentees = Mentee.all
    @mentors = Mentor.all
    @all_matches = Match.all
    @user_matches = Match.where(user_id: current_user.id, accepted: false, rejected:false)
    puts "Hi belle its okay"
    @mentor_matches = fill_mentor_matches()     #array of Mentors
    @mentee_matches = fill_mentee_matches()     #array of Mentees
    @user_match = nil
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
    puts "rejecting mathc now"
    @match = Match.find_by(id: params[:match_id].to_i)
    rejected = true
    @match.reject(rejected)
    redirect_to explore_path
end

end