class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    respond_to do |format| format.html{redirect_to '/', notice: "sucess"} end
  end

  def user_params
    params.require(:user).permit(:first, :last, :email, :major)
  end
end
