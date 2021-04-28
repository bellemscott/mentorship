import CableReady from 'cable_ready'
import consumer from "./consumer"

consumer.subscriptions.create("MatchingChannel", {
  // connected() {
  //   // Called when the subscription is ready for use on the server
  // },

  // disconnected() {
  //   // Called when the subscription has been terminated by the server
  // },

  received(data) {
    if (data.cableReady) CableReady.perform(data.operations)
    // Called when there's incoming data on the websocket for this channel
  }
});
