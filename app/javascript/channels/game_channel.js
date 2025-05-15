import consumer from "./consumer"

const gameId = window.location.pathname.match(/\/games\/(\d+)/)?.[1];
console.log(gameId);

consumer.subscriptions.create({channel: "GameChannel", game: gameId}, {
  connected() {
    console.log("Connected to channel");
    
  },

  disconnected() {
    console.log("Disconnected from channel");
  },

  received(data) {
    console.log(data);
    
    // if (data.redirect_to) {
    //   window.location.href = data.redirect_to;
    // }
  }
});
