
class MessageRelayJob < ApplicationJob
    queue_as :default
  
    def perform(message)
      ActionCable.server.broadcast "chatrooms:#{message.chatroom.id}", {
        firstname: message.user.firstname,
        body: message.body,
        chatroom_id: message.chatroom.id
      }
      puts message.user.firstname
      puts message.body
      puts message.chatroom.id
      puts "suck my dick"
    end
  end