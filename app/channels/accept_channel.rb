class AcceptChannel < ApplicationCable::Channel
    def subscribed
      stream_from "accepting"
    end
  end
  