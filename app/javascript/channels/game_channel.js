import consumer from "./consumer"

$( document ).on('turbolinks:load', function() {
  const gameContainer = $('#game-container')
  if (gameContainer.length <= 0) { return }

  const gameId = gameContainer.data('game-id')
  const playerId = gameContainer.data('player-id')
  const startBtn = $('#start-game-btn')

  const params = {
    channel: 'GameChannel',
    game_id: gameId,
    player_id: playerId,
  }

  consumer.subscriptions.create(params, {
    initialized() {

    },

    connected() {
      console.log('connected')


      this.setup()
    },

    disconnected() {
      console.log('disconnected')
    },

    received(data) {
      console.log('received: ', data)
    },

    // private

    setup() {
      this.addListeners()
    },

    startGame() {
      this.perform("start_game")
    },

    addListeners() {
      startBtn.click((e) => {
        this.startGame()
      })
    }
  });
})
