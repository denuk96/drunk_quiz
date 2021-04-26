import consumer from "./consumer"

export default function connectToGame(gameId, options = {}) {
  let params = Object.assign({channel: 'GameChannel', game_id: gameId}, options)

  consumer.subscriptions.create(params, {
    connected() {
      console.log('connected')
    },

    disconnected() {
      console.log('disconnected')
    },

    received(data) {
      console.log('received: ', data)
    }
  });
}

