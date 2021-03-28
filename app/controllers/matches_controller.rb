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
    puts @matches_for_user.length()
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
      mentor.id == current_user.id
      mentor.user_id == current_user.id
      @mentor = Mentor.where(user_id: current_user.id)
      @mentess.each do |mentee|
        if mentee.user_id != @mentor.user_id
          if @mentor.length_of_mentorship==mentee.length_of_mentorship
            @newMatch= Match.new(current_user.id,@mentor.id,mentee.id)
            @matches_arr.push(@newMatch)
          end
        end
      end
    elsif current_user.mentor && current_user.mentee
      @mentors.each do |mentor|
        @mentess.each do |mentee|
            if mentee.user_id != mentor.user_id 
                if mentor.length_of_mentorship==mentee.length_of_mentorship
                    @newMatch= Match.new(current_user.id,mentor.id,mentee.id)
                    @matches_arr.push(@newMatch)
                end
            end
        end
      end
    else
      puts "In the matches controller, about to fill the matches arr"
      @mentee = Mentee.find_by(user_id: current_user.id)
      #puts "heres regular mentee record"
      #puts @mentee[:length_of_mentorship]
      @mentors.each do |mentor|
        if current_user.id != mentor.user_id
          if mentor.length_of_mentorship==@mentee.length_of_mentorship
            newMatch= Match.new()
            newMatch.user_id = current_user.id
            newMatch.mentor_id = mentor.id
            puts "check one"
            puts newMatch.mentor_id
            newMatch.mentee_id = @mentee.id
            puts "check two"
            puts newMatch.mentee_id
            @matches_arr.push(@newMatch)
          end
        end
      end
      puts "heres the length of the matches array"
      puts @matches_arr.length()
      puts "heres proof of it entering the hash, should be the matches array"
      @@matches_hash[:current_user] = @matches_arr
      puts @@matches_hash.length()
    end

end
    



  def set_match
    
  end

  # Only allow a list of trusted parameters through.
  def mentor_params

  end

end