class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = current_user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def additional_mentor
    @mentor = Mentor.new()
    render 'additional_mentor'
  end

  def additional_mentee
    @mentee = Mentee.new()
    render 'additional_mentee'
  end

  # POST /users or /users.json

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the app!"
      puts user_params[:mentor]
      if user_params[:mentor] == "1" && user_params[:mentee] == "1" 
        additional_both()
      elsif user_params[:mentor] == "1" && user_params[:mentee] == "0"
        additional_mentor()
      elsif user_params[:mentor] == "0" && user_params[:mentee] == "1"
        additional_mentee()
      else
        redirect_to homeloggedin_path
      end
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :mentor, :mentee)
    end
end
