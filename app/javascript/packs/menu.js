window.redirectToGameNum = () => {
	let num = document.getElementById('room_number').value
	let link = `/games/${num}/players/new`
	Turbolinks.visit(link)
}