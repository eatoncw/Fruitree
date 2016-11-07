var flashFade = function() {
	$('.alert').fadeOut(8000);
};

var highlightComments = function() {
	$('.comments').mouseenter(function() {
		$(this).addClass("comments-highlight");
		$( this ).find(".flag").addClass("flag-show");
	});
	$('.comments').mouseleave(function() {
		$(this).removeClass("comments-highlight");
		$( this ).find(".flag").removeClass("flag-show");
	});
};

var rated = function() {
	$('.rated').raty( { path: '',
		readOnly: true,
		score: function() {
			return $(this).attr('data-score');
		}
	});
};

$(document).on('turbolinks:load', function () {
	flashFade();
	highlightComments();
	$('[data-toggle="tooltip"]').tooltip({'placement': 'top'});
	
	$('.rating').raty( { path: '', scoreName: 'comment[rating]' } );
	rated();
	
});