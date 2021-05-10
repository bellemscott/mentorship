class DirectMessagesController < ApplicationController
  #  before_action :authenticate_user!
  
    def show
      users = [current_user, User.find(params[:id])]
      puts users
      @chatroom = Chatroom.direct_message_for_users(users)
      @messages = @chatroom.messages.order(created_at: :desc).limit(100).reverse
      @chatroom_users = current_user.chatroom_users.where(chatroom_id: @chatroom.id)
      puts "seagull"
      puts current_user.chatroom_users
      puts @chatroom_users
      puts @chatroom.id
      puts "gullgull"
      render "chatrooms/show"
    end
  end