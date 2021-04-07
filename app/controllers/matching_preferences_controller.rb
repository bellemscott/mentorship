class MatchingPreferencesController < ApplicationController
  before_action :set_matching_preference, only: %i[ show edit update destroy ]

  # GET /matching_preferences or /matching_preferences.json
  def index
    @matching_preferences = MatchingPreference.all
  end

  # GET /matching_preferences/1 or /matching_preferences/1.json
  def show
  end

  # GET /matching_preferences/new
  def new
    @matching_preference = MatchingPreference.new
  end

  # GET /matching_preferences/1/edit
  def edit
    redirect_to "#"
  end

  # POST /matching_preferences or /matching_preferences.json
  def create
    @matching_preference = MatchingPreference.new(matching_preference_params)

    respond_to do |format|
      if @matching_preference.save
        format.html { redirect_to "#", notice: "Matching preference was successfully created." } # we will have to change this redirect to 
        format.json { render :show, status: :created, location: @matching_preference }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @matching_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matching_preferences/1 or /matching_preferences/1.json
  def update
    respond_to do |format|
      if @matching_preference.update(matching_preference_params)
        format.html { redirect_to "#", notice: "Matching preference was successfully updated." }
        format.json { render :show, status: :ok, location: @matching_preference }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @matching_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matching_preferences/1 or /matching_preferences/1.json
  def destroy
    @matching_preference.destroy
    respond_to do |format|
      format.html { redirect_to matching_preferences_url, notice: "Matching preference was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matching_preference
      @matching_preference = MatchingPreference.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def matching_preference_params
      params.require(:matching_preference).permit(:location, :length_of_mentorship, :common_subjects, :brandeis_alumni)
    end
end
