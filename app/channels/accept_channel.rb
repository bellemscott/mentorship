class AcceptChannel < ApplicationCable::Channel
    def subscribed
      stream_from "accepted"
    end
  end
  