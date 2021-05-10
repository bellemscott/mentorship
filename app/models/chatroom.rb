class Chatroom < ApplicationRecord
    has_many :chatroom_users, dependent: :destroy
    has_many :users, through: :chatroom_users
    has_many :messages, dependent: :destroy
  
    scope :public_channels, ->{ where(direct_message: false) }
    scope :direct_messages, ->{ where(direct_message: true) }
  
    def self.direct_message_for_users(users)
      user_ids = users.map(&:id).sort
      name = "DM:#{user_ids.join(":")}"
      puts "not reaching if "
      if chatroom = direct_messages.where(name: name).first
        puts "not going in"
        chatroom
      else
        # create a new chatroom
        puts "creating a new chatroom"
        chatroom = new(:name => name, :direct_message => true)
        #chatroom.users = users
        chatroom.users = users
        chatroom.save
        chatroom
        puts chatroom.id
        puts chatroom
      end
      return chatroom
    end
  end