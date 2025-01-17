class MenteesController < ApplicationController
  before_action :set_mentee, only: %i[ show edit update destroy ]
  # GET /mentees or /mentees.json
  require 'matches_controller.rb'
  def index
    @mentees = Mentee.all
  end

  # GET /mentees/1 or /mentees/1.json
  def show
    @user = current_user
  end

  # GET /mentees/new
  def new
    @mentee = Mentee.new
  end

  # GET /mentees/1/edit
  def edit
  end

  # POST /mentees or /mentees.json
  def create
    @mentee = Mentee.new(mentee_params)
    @users=User.all
    @user=@users.last
    @mentee[:user_id] = @user.id
    if @mentee.save
      if current_user.mentor && current_user.mentee
        @mentor = Mentor.new()
        render 'additional_mentor'
      else
        redirect_to home_path
      end
    end
  end

  # PATCH/PUT /mentees/1 or /mentees/1.json
  def update
    respond_to do |format|
      if @mentee.update(mentee_params)
        format.html { redirect_to @mentee, notice: "Mentee was successfully updated." }
        format.json { render :show, status: :ok, location: @mentee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mentee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mentees/1 or /mentees/1.json
  def destroy
    @mentee.destroy
    respond_to do |format|
      format.html { redirect_to mentees_url, notice: "Mentee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mentee
      @mentee = Mentee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mentee_params
      params.require(:mentee).permit(:user_id,:major, :area_of_interest, :preferred_method_of_contact, :location, :length_of_mentorship, :graduation_year, :avatar)
    end
end
