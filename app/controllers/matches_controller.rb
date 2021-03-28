class MatchesController < ApplicationController
    before_action :set_match, only: %i[ show edit update destroy ]

  @@matches_hash = {}
  # GET /mentors or /mentors.json
  def index
    create()
    @mentors = Mentor.all
    @mentees=Mentee.all
    @users=User.all
    @matches_for_user = @@matches_hash
    puts "heres the final test"
    puts @matches_for_user
    #@users = User.all
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

  # POST /mentors or /mentors.json
  def create
    # @user = @users.last
    @mentors = Mentor.all
    @mentees= Mentee.all 
    puts @mentees.length()

   # @major_to_curent_position #implement map
    @matches_arr=[]
    if current_user.mentor
      @mentor = Mentor.find_by(user_id: current_user.id)
      @mentees.each do |mentee|
        if mentee.user_id != @mentor.user_id
          if @mentor.length_of_mentorship==mentee.length_of_mentorship
            newMatch= Match.new(:user_id => current_user.id, :mentor_id => @mentor.id, :mentee_id => mentee.id)
            newMatch.save
            @matches_arr.push(newMatch)
          end
        end
      end
      @@matches_hash[current_user.id] = @matches_arr
    elsif current_user.mentor && current_user.mentee
      @mentors.each do |mentor|
        @mentess.each do |mentee|
            if mentee.user_id != mentor.user_id 
                if mentor.length_of_mentorship==mentee.length_of_mentorship
                  newMatch= Match.new(:user_id => current_user.id, :mentor_id => mentor.id, :mentee_id => @mentee.id)
                  newMatch.save
                  @matches_arr.push(@newMatch)
                end
            end
        end
      end
    else
      puts "In the matches controller, about to fill the matches arr"
      @mentee = Mentee.find_by(user_id: current_user.id)
      @mentors.each do |mentor|
        if current_user.id != mentor.user_id
          if mentor.length_of_mentorship==@mentee.length_of_mentorship
            newMatch= Match.new(:user_id => current_user.id, :mentor_id => mentor.id, :mentee_id => @mentee.id)
            newMatch.save
            @matches_arr.push(newMatch)
          end
        end
      end
      @@matches_hash[current_user.id] = @matches_arr
    end

end
    



  def set_match
    
  end

  # Only allow a list of trusted parameters through.
  def mentor_params

  end

end