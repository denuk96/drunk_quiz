import consumer from "./consumer"

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

    connected() {
      console.log('connected')


      this.setup()
    },

    disconnected() {
      console.log('disconnected')
    },

    received(data) {
      console.log('received: ', data)
      questionBody.html(questionTemplate(data))
    },

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
        e.target.hide()
      })

      nextQuestionBtn.click(e => {
        this.nextQuestion()
      })
    },
  });

  function questionTemplate(data) {
    if (data.question) {
      return `
      <h5>Question for <b>${data.player_name}</b></h5>
      <div>
        ${data.question}
      </div>
      <div>
        Questions left ${data.questions_left}
      </div>
    `
    } else {

    }
  }
})
