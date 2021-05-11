class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]

  # GET /channels
  # GET /channels.json
  def index
    @channels = Channel.all
    @user_channels = current_user.channels
  end

  # GET /channels/1
  # GET /channels/1.json
  def show
    @channel_user = current_user.channel_users.find_by(channel: @channel)
    @last_read_at = @channel_user&.last_read_at || @channel.created_at
    @channel_user&.touch(:last_read_at)
  end

  # GET /channels/new
  def new
    @channel = Channel.new
  end

  # GET /channels/1/edit
  def edit
  end

  # POST /channels
  # POST /channels.json
  def create
    @all_channels = Channel.all
    duplicate = false
    @all_channels.each do |channel|
      seconduser = User.find_by(id:params[:second_user])
      s = "#{current_user.firstname} #{current_user.lastname} and #{seconduser.firstname} #{seconduser.lastname}"
      if channel.name == s
        duplicate = true
        @channel = channel
      end
    end
    if duplicate == false
      @channel = Channel.new(channel_params)
      @channel.save
    end
    redirect_to channel_channel_user_path(@channel, :channel_user_params => {second_user: params[:second_user]})
  end

  # PATCH/PUT /channels/1
  # PATCH/PUT /channels/1.json
  def update
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to @channel, notice: 'Channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @channel }
      else
        format.html { render :edit }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, notice: 'Channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def channel_params
      params.require(:channel).permit(:name, :second_user)
    end
end
