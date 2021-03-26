class MatchesController < ApplicationController
    before_action :set_enrollment, only: %i[ show edit update destroy ]
  
    def index
      @matches = Match.all
      @user = current_user
    end
  
    def show
    end
  
    def new
      @match = Match.new
    end
  
    def edit
    end
  
    def create
        @match = Match.new(match_params)
        matches = Match.all
        repititions = 0
        matches.each do |match|
            if
            end
        end
        if repititions == 0
            if @enrollment.save
                flash[:sucess] = "succesfully enrolled"
                redirect_to enroll_path
            else
                render 'new'
            end
        else
            flash[:alert] = "already enrolled in course"        #wont let user enroll in same course twice
        end

    end
  
    def update
      respond_to do |format|
        if @enrollment.update(enrollment_params)
          format.html { redirect_to @enrollment, notice: "Enrollment was successfully updated." }
          format.json { render :show, status: :ok, location: @enrollment }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @enrollment.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @enrollment.destroy
      respond_to do |format|
        format.html { redirect_to enrollments_url, notice: "Enrollment was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_enrollment
        @enrollment = Enrollment.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def enrollment_params
        params.require(:enrollment).permit(:user_id, :course_id, :coursename, :coursedescription)
      end
  end
end
