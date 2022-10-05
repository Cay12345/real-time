import consumer from "./consumer"

consumer.subscriptions.create("ChatsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $("#msg-" + data.chat_id).html(data.layout)
  }
});
