class ChannelUsersController < ApplicationController
  before_action :set_channel

  def create
    channelid = params[:channel_id]
    @channel = Channel.last
    @channel.channel_users.where(user: current_user).first_or_create
    @channel.channel_users.where(user: @second_user).first_or_create
    redirect_to @channel
  end

  def show
    @second_user = params[:second_user]
  end

  def destroy
    @channel.channel_users.where(user: current_user).destroy_all
    redirect_to @channel
  end

  private

    def set_channel
    end

    def channel_user_params
      params.require(:channel_users).permit(:second_user, :channel_id)
    end
end
