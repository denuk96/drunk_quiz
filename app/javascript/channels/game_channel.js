import consumer from "./consumer"
import shakeEffect from "../packs/shake_effect";
import {updatePlayersList} from "../packs/game/targetQuestion";
import questionTemplate from "../packs/templates/question";

$( document ).on('turbolinks:load', function() {
  const gameContainer = $('#game-container')
  if (gameContainer.length <= 0) { return }

  const gameId = gameContainer.data('game-id')
  const playerId = gameContainer.data('player-id')
  const startBtn = $('#start-game-btn')
  const nextQuestionBtn = $('#next-question-btn')
  const questionBody = $('#question_body')

  const params = {
    channel: 'GameChannel',
    game_id: gameId,
    player_id: playerId,
  }

  consumer.subscriptions.create(params, {
    // called once from very beginning
    initialized() {

    },

    // called on subscribing to channel
    connected() {
      console.log('connected')
      this.setup()
    },

    // called on disconnecting
    disconnected() {
      console.log('disconnected')
    },

    // called when server publish something
    received(data) {
      console.log('received: ', data)
      switch (data.type) {
        case 'game_state':
          if (data.message === 'started') { document.location.reload() }
          break
        case 'question':
          this.renderQuestion(data.message)
          break
      }
      updatePlayersList(data.players, playerId)
    },

    // custom instance methods
    setup() {
      this.addListeners()
    },

    startGame() {
      this.perform("start_game")
    },

    nextQuestion() {
      this.perform("next_question")
    },

    renderQuestion(data) {
      questionBody.html(questionTemplate(data))
      shakeEffect(questionBody[0])
      if (data.question == null) { nextQuestionBtn.hide() } else { nextQuestionBtn.show() }
    },

    addListeners() {
      startBtn.click(e => {
        this.startGame()
        document.location.reload();
      })

      nextQuestionBtn.click(e => {
        e.stopPropagation()
        this.nextQuestion()
      })
    },
  });
})
