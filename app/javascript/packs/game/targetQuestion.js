export function updatePlayersList(players, playerId) {
	let selectablePlayers = players.filter(p => p.id !== playerId)
	appendSelect(selectablePlayers)
}

function appendSelect(selectablePlayers) {
	let select = $('#target-question-container__players-selector')
	select.empty()

	selectablePlayers.forEach((p) => {
		let option = document.createElement("option")
		option.textContent = p.name
		option.value = p.id
		select.append(option)
	})
}