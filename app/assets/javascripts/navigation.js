var flashFade = function() {
	$('.alert').fadeOut(8000);
};

$(document).on('turbolinks:load', function () {
	flashFade();
});