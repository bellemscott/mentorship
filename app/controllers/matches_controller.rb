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

  #user is mentor : identifier 0 mentee : identifier 1 both : identifier 2
  def check_duplicate(newMatch, identifier)
    duplicate = false
    matches = Match.all
    matches.each do |match|
      if match.user_id == newMatch.user_id && match.mentor_id == newMatch.mentor_id && match.mentee_id == newMatch.mentee_id
        duplicate = true
      end
    end
    if duplicate == false
      newMatch.save
      if identifier == 0
        make_mentee_match(newMatch)
      elsif identifier == 1
        make_mentor_match(newMatch)
      end
    end
    @matches_arr.push(newMatch)
  end

  def make_mentee_match(newMatch)
    @users = User.all
    other_party = @mentees.find_by(id: newMatch.mentee_id)
    other_party_user_id = other_party.user_id
    other_user = @users.find_by(id: other_party_user_id)
    otherMatch= Match.new(:user_id => other_party_user_id, :mentor_id => newMatch.mentor_id, :mentee_id => newMatch.mentee_id, :accepted => false)    #creates the other match
    otherMatch.save

    cable_ready["matching"].insert_adjacent_html(
      selector: "#matching",
      position: "afterbegin",
      html: render_to_string(partial:'welcome/carosel', locals: {match:otherMatch})
    )
    cable_ready.broadcast
    puts "here belle!!! making other mentee match"
  end

  def make_mentor_match(newMatch)
    @users = User.all
    other_party = @mentors.find_by(id: newMatch.mentor_id)
    other_party_user_id = other_party.user_id
    other_user = @users.find_by(id: other_party_user_id)
    otherMatch= Match.new(:user_id => other_party_user_id, :mentor_id => newMatch.mentor_id, :mentee_id => newMatch.mentee_id, :accepted => false)    #creates the other match
    otherMatch.save
    cable_ready["matching"].insert_adjacent_html(
      selector: "#matching",
      position: "afterbegin",
      html: render_to_string(partial:'welcome/carosel', locals: {possible_match:otherMatch})
    )
    cable_ready.broadcast
    puts "here belle!!! making other mentor match"
  end

  # def make_other_match(newMatch)
  #   @users = User.all
  #   other_party = @mentees.find_by(id: newMatch.mentee_id)
  #   other_party_user_id = other_party.user_id
  #   other_user = @users.find_by(id: other_party_user_id)
  #   otherMatch= Match.new(:user_id => other_party_user_id, :mentor_id => newMatch.mentor_id, :mentee_id => newMatch.mentee_id, :accepted => false)    #creates the other match
  #   otherMatch.save
  # end

  def is_mentor()
    @mentor = Mentor.find_by(user_id: current_user.id)
      @mentees.each do |mentee|
        if mentee.user_id != @mentor.user_id
          if (@common_subjects_map[mentee.major]) != nil    #if theres a record in map for particular job/major
            if @mentor.length_of_mentorship==mentee.length_of_mentorship or (@common_subjects_map[mentee.major].include? @mentor.current_position)
              newMatch= Match.new(:user_id => current_user.id, :mentor_id => @mentor.id, :mentee_id => mentee.id, :accepted => false)
              check_duplicate(newMatch, 0)
              #newMatch.save
              #make_other_match(newMatch)
            end
          else
            if @mentor.length_of_mentorship==mentee.length_of_mentorship 
              newMatch= Match.new(:user_id => current_user.id, :mentor_id => @mentor.id, :mentee_id => mentee.id, :accepted => false)
              check_duplicate(newMatch, 0)
              #newMatch.save
              #make_other_match(newMatch, 0)
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
            newMatch= Match.new(:user_id => current_user.id, :mentor_id => mentor.id, :mentee_id => @mentee.id, :accepted => false)
            #check_duplicate(newMatch, 1)
            newMatch.save
          end
        else
          if (mentor.length_of_mentorship==@mentee.length_of_mentorship)
            newMatch= Match.new(:user_id => current_user.id, :mentor_id => mentor.id, :mentee_id => @mentee.id, :accepted => false)
            check_duplicate(newMatch, 1)
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