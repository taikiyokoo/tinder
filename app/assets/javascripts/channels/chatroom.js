App.chatroom = App.cable.subscriptions.create("ChatroomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    return alert(data['chat_message']);
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    const chatMessages = document.getElementById('chat-messages');
    chatMessages.insertAdjacentHTML('beforeend', data['chat_message']);
    // Called when there's incoming data on the websocket for this channel
  },

  speak: function(chat_message,chatroom_id) {
    return this.perform('speak', { chat_message: chat_message,chatroom_id: chatroom_id  });
  }
});

if(/chatrooms/.test(location.pathname)) {
  $(document).on("keydown", ".chat-room__message-form_textarea", function(e) {
    if (e.key === "Enter") {
      const chatroom_id = $('textarea').data('chatroom_id')
      App.chatroom.speak(e.target.value,chatroom_id);
      e.target.value = '';
      e.preventDefault();
    }
  })
}