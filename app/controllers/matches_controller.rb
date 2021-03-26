class MatchesController < ApplicationController
    before_action :set_match, only: %i[ show edit update destroy ]

  # GET /mentors or /mentors.json
  def index
    create()
    @mentors = Mentor.all
    @mentees=Mentee.all
    @users=User.all
    @matches_for_user = @matches_arr
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
    @mentors.each do |mentor|
        @mentess.each do |mentee|
            if mentee.user_id != mentor.user_id 
                if mentor.length_of_mentorship==mentee.length_of_mentorship
                    @newMatch= Match.new(current_user.id,mentor.id,@entee.id)
                    @matches_arr.push(@newMatch)
                end
          
            end
        end
    end
end
    



  def set_match
    
  end

  # Only allow a list of trusted parameters through.
  def mentor_params

  end

end