import consumer from "./consumer"
import shake_effect from "../packs/shake_effect";

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
      questionBody.html(questionTemplate(data))
      shake_effect(questionBody[0])
      if (data.question == null) { nextQuestionBtn.hide() }
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

  function questionTemplate(data) {
    if (data.question) {
      return `
      <h5><b>${data.player_name}</b></h5>
      <hr>
      <p>
        ${data.question}
      </p>
      <span>
        Left ${data.questions_left}..
      </span>
    `
    } else {
      return `
      <h5>No questions left</h5>
      <p>
        <a href="/">To main</a>
      </p>
    `
    }
  }
})
