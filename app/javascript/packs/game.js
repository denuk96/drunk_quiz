import gameChannel from '../channels/game_channel'

$( document ).on('turbolinks:load', function() {
	let gameContainer = $('#game-container')
	if (gameContainer.length <= 0) { return }

	let gameId = gameContainer.data('game-id')
	// let playerId = gameContainer.data('player-id')

	gameChannel(gameId)
})