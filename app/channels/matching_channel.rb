class MatchingChannel < ApplicationCable::Channel
  def subscribed
    stream_from "matching"
  end

  # def unsubscribed
  #   # Any cleanup needed when channel is unsubscribed
  # end
end
