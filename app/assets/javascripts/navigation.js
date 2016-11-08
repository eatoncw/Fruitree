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
	$('.rated').raty( { path: '/assets',
		readOnly: true,
		score: function() {
			return $(this).attr('data-score');
		}
	});
};

var searchButtonToggle = function() {
	$('.search-toggle').on('click', function() {
		if ($(this).closest(".search-form").find("input[type=text]").val().length < 1 ) {
			$(this).val('Go');
		} else if ($(this).val() === 'Go'){
			$(this).val('Reset');
		} else {
			$(this).val('Go');
		}
	});
}

$(document).on('turbolinks:load', function () {
	flashFade();
	highlightComments();
	$('[data-toggle="tooltip"]').tooltip({'placement': 'top'});
	
	$('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' } );
	rated();
	searchButtonToggle();


		
		//$(this).attr('id', 'search-button-reset');
		//event.stopPropagation();

	//});
	//$('#search-button-reset').on('click', function(event) {
		//$(this).val(toggleText);
		//$(this).attr('id', 'search-button');
	//});
	
});