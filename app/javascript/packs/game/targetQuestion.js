export function updatePlayersList(players, playerId) {
	let selectablePlayers = players.filter(p => p.id !== playerId)
	prepareView(selectablePlayers)
}


function prepareView(selectablePlayers) {
	const container = $('#target-question-container')
	if (container.length === 0 || selectablePlayers.length === 0) { return }

	const maxTargetQuestion = container.data('game-target-questions-max')
	const playerAvailableTargetQuestion = container.data('available-target-question')
	const collapseBtn = $('.target-question-container__toggle-btn')
	const form = $('.target-question-container__form')

	disableBtn(maxTargetQuestion, collapseBtn)
	showTargetQuestionReminded(playerAvailableTargetQuestion)

	if (playerAvailableTargetQuestion > 0) {
		appendSelect(form, selectablePlayers)
	} else {

	}
}

function disableBtn(maxTargetQuestion, collapseBtn) {
	if (maxTargetQuestion === null || maxTargetQuestion === 0) { collapseBtn.addClass('disabled') }
}

function showTargetQuestionReminded(numLeft) {
	$('.target-question-container__left').text(`  (${numLeft} left)`)
}

function appendSelect(form, selectablePlayers) {
	form.empty()
	let select = document.createElement("select")
	form.append(select)

	selectablePlayers.forEach((p) => {
		let option = document.createElement("option")
		option.textContent = p.name
		option.value = p.id
		select.append(option)
	})
}