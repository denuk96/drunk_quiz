import QRCode from 'qrcode'

$( document ).on('turbolinks:load', function() {
	const place = $('#current-page-qr-code')
	if (place.length <= 0) { return }
	const text = window.location.href

	const opts = {
		errorCorrectionLevel: 'H',
		type: 'image/jpeg',
		quality: 0.3,
		margin: 1,
		color: {
			dark:"#010599FF",
			light:"#ffffff"
		}
	}

	QRCode.toDataURL(text, opts,function (err, url) {
		let image = new Image();
		image.src = url
		place.append(image);
	})
})