class NotifyChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notifs"
  end

  # def unsubscribed
  #   # Any cleanup needed when channel is unsubscribed
  # end
end
