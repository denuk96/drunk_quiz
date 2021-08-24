export default function questionTemplate(data) {
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